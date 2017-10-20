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
    @game = current_user.games.find_by(uuid: params[:id])
    @game.nations.all.each {|n| n.destroy}
    @game.units.all.each {|u| u.destroy}
    @game.destroy
    redirect_to games_path
  end

  def show
    @game = current_user.games.find_by(uuid: params[:id])
    session[:game_uuid] = @game.uuid
  end

  def end_turn
    current_nation.end_turn
    if current_nation.name == ("Britain" || "UK Europe")  && next_nation.name == ("Pacific" || "FEC")
      current_game.update(current: current_game.current+1)
      current_game.nations.find_by(nid: current_game.current).end_turn
      if request.xhr?
        render :json => {
          oo_nation: prev_nation.name,
          oo_bank: prev_nation.bank,
          o_nation: current_game.nations.find_by(nid: current_game.current).name,
          o_bank: current_game.nations.find_by(nid: current_game.current).bank,
          nation: next_nation.name,
          color: next_nation.color,
          colorL: next_nation.colorL,
          bank: next_nation.bank,
          income: next_nation.income,
          roundel: next_nation.roundel,
          uuid: next_nation.uuid
        }
      end
    elsif current_nation.name == ("Pacific" || "FEC")
      prev_nation.end_turn
      if request.xhr?
        render :json => {
          oo_nation: prev_nation.name,
          oo_bank: prev_nation.bank,
          o_nation: current_game.nations.find_by(nid: current_game.current).name,
          o_bank: current_game.nations.find_by(nid: current_game.current).bank,
          nation: next_nation.name,
          color: next_nation.color,
          colorL: next_nation.colorL,
          bank: next_nation.bank,
          income: next_nation.income,
          roundel: next_nation.roundel,
          uuid: next_nation.uuid
        }
      end
    else
      if request.xhr?
        render :json => {
          o_nation: current_nation.name,
          o_bank: current_nation.bank,
          nation: next_nation.name,
          color: next_nation.color,
          colorL: next_nation.colorL,
          bank: next_nation.bank,
          income: next_nation.income,
          roundel: next_nation.roundel,
          uuid: next_nation.uuid
        }
      end
    end

    current_game.update(current: current_game.current+1)
    if(current_game.current>current_game.nations.last.nid)
      current_game.update(current: 0)
    end
    eco_to_current
    reset_units
    current_game.update(bank: current_game.nations.find_by(nid: current_game.current).bank)
  end

  def buy_pacific
    current_game.update(current: current_game.current+1)
    if request.xhr?
      render :json => {
        nation: current_nation.name,
        color: current_nation.color,
        colorL: current_nation.colorL,
        bank: current_nation.bank,
        income: current_nation.income,
        roundel: current_nation.roundel,
        uuid: current_nation.uuid
      }
    end
    eco_to_current
    reset_units
    current_game.update(bank: current_nation.bank)
  end

  def buy_unit
    @unit = current_game.units.find_by(uid: params[:uid])
    current_nation.buy_unit(@unit)
    if current_eco!=current_nation
      eco_to_current
      if request.xhr?
        render :json => {
          count: @unit.count,
          name: params[:uid],
          nation: current_nation.name,
          bank: current_nation.bank,
          income: current_nation.income,
          color: current_nation.color,
          colorL: current_nation.colorL,
          change: true
        }
      end
    else
      if request.xhr?
        render :json => {
          count: @unit.count,
          name: params[:uid],
          nation: current_nation.name,
          bank: current_nation.bank,
          change: false
        }
      end
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
        colorL: current_eco.colorL,
        bank: current_eco.bank,
        income: current_eco.income,
        uuid: current_eco.uuid
      }
    end
  end

  def change_bank
    @amount = params[:amount].to_i
    current_eco.update(bank: current_eco.bank+@amount)
    if(current_eco.bank<0)
      current_eco.update(bank: 0)
    end
    if current_eco==current_nation
      if request.xhr?
        render :json => {
          nation: current_eco.name,
          bank: current_eco.bank,
          same_n: true
        }
      end
    else
      if request.xhr?
        render :json => {
          nation: current_eco.name,
          bank: current_eco.bank,
          same_n: false
        }
      end
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

  def reset_buy
    reset_units
    current_nation.update(bank: current_game.bank)
    if request.xhr?
      render :json => {
        nation: current_nation.name,
        bank: current_nation.bank,
      }
    end
  end

  def reset_victory_research
    current_game.victories.each do |v|
      v.update(enabled: false)
    end
    current_game.nations.each do |n|
      n.researches.each do |r|
        r.update(enabled: false)
      end
    end
    if request.xhr?
      render :json => {
      }
    end
  end

  private
    def reset_units
      current_game.units.each {|u| u.update(count: 0)}
    end

    def eco_to_current
      current_game.update(eco: current_game.current)
    end

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
        Objective.create_1940(@game.uuid)
        Research.create_1940(@game.uuid)
      elsif @game.game_name == "Grasshopper"
        Nation.create_1940_Grasshopper(@game.uuid)
        Unit.create_1940_Grasshopper(@game.uuid)
        Objective.create_1940_Grasshopper(@game.uuid)
        Victory.create_1940_Grasshopper(@game.uuid)
        Research.create_1940_Grasshopper(@game.uuid)
      elsif @game.game_name == "1942"
        Nation.create_1942(@game.uuid)
        Unit.create_1942(@game.uuid)
      elsif @game.game_name == "1914"
        Nation.create_1914(@game.uuid)
        Unit.create_1914(@game.uuid)
      end
    end
end
