class GamesController < ApplicationController
  before_action :check_current_user
  #before_action :next_nation, only: [:show, :end_turn]

  def create
    @game = current_user.games.new(game_params)
    @game.update(user_uuid: current_user.uuid)

    if @game.save
      create_game
      session[:game_uuid] = @game.uuid
      redirect_to game_path(@game.uuid)
    else
      render 'new'
    end
  end

  def new
    @game = current_user.games.new
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
        n_color: next_nation.color
      }
    end
    current_game.update(current: current_game.current+1)
    if(current_game.current>current_game.nations.last.nid)
      current_game.update(current: 0)
    end
  end

  def buy_unit
    #current_game.units.find_by(uid: ).update(count: current_game.units.find_by(uid: ).count+1)
    if request.xhr?
      render :json => {
    #    count: current_game.units.find_by(uid: ).count
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
