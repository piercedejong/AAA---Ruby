class GamesController < ApplicationController
  before_action :check_current_user
  #before_action :next_nation, only: [:show, :end_turn]

  def create
    @game = current_user.games.new(game_params)
    @game.update(user_uuid: current_user.uuid)

    if @game.save
      create_game
      session[:game_uuid] = @game.uuid
      current_game.update(bank: current_nation.bank)
      redirect_to game_path(@game.uuid)
    else
      render 'new'
    end
  end

  def new
    @game = current_user.games.new
  end

  def destroy
    #@game = current_user.games.find_by(uuid: )
    #@game.Nation.all.each {|x| x.destroy}
    #@game.Unit.all.each {|x| x.destroy}
  end

  def show
    @game = current_user.games.find_by(uuid: params[:id])
    session[:game_uuid] = @game.uuid
  end

  def end_turn
    current_nation.update(bank: current_nation.bank+current_nation.income)
    if request.xhr?
      render :json => {
        nation: current_nation.name,
        bank: current_nation.bank,
        n_nation: next_nation.name,
        n_color: next_nation.color,
        n_colorL: next_nation.colorL
      }
    end
    current_game.update(current: current_game.current+1)
    if(current_game.current>current_game.nations.last.nid)
      current_game.update(current: 0)
    end
    current_game.units.each {|u| u.update(count: 0)}
    current_game.update(eco: current_game.current)
    current_game.update(bank: current_nation.bank)
  end

  def buy_unit
    @uid = params[:uid]
    if current_nation.bank - current_game.units.find_by(uid: @uid).cost >=0
      current_game.units.find_by(uid: @uid).update(count: current_game.units.find_by(uid: @uid).count+1)
      current_nation.update(bank: current_nation.bank - current_game.units.find_by(uid: @uid).cost)
    end
    if request.xhr?
      render :json => {
        count: current_game.units.find_by(uid: @uid).count,
        name: @uid,
        nation: current_nation.name,
        bank: current_nation.bank
      }
    end
  end

  def change_eco
    current_game.update(eco: current_game.eco+1)
    if(current_game.eco>current_game.nations.last.nid)
      current_game.update(eco: 0)
    end
    if request.xhr?
      render :json => {
        nation: current_eco.name,
        color: current_eco.color,
        colorL: current_eco.colorL
      }
    end
  end

  def change_bank
    @amount = params[:amount].to_i
    current_eco.update(bank: current_eco.bank+@amount)
    if(current_eco.bank<0)
      current_eco.update(bank: 0)
    end
    if request.xhr?
      render :json => {
        nation: current_eco.name,
        bank: current_eco.bank
      }
    end
  end

  def change_income
    @amount = params[:amount].to_i
    current_eco.update(income: current_eco.income+@amount)
    if(current_eco.income<0)
      current_eco.update(income: 0)
    end
    if request.xhr?
      render :json => {
        nation: current_eco.name,
        income: current_eco.income
      }
    end
  end

  private
    def check_current_user
      if !current_user
        redirect_to root_path
      end
    end

    def game_params
      params.require(:game).permit(:game_name, :name)
    end

    def create_game
      if @game.game_name == "1940"
        Nation.create_1940(@game.uuid)
        Unit.create_1940(@game.uuid)
      elsif @game.game_name == "1942"
        Nation.create_1942(@game.uuid)
        Unit.create_1942(@game.uuid)
      elsif @game.game_name == "1914"
        Nation.create_1914(@game.uuid)
        Unit.create_1914(@game.uuid)
      end
    end
end
