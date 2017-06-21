class GamesController < ApplicationController
  before_action :check_current_user

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
      binding.pry
    end


end
