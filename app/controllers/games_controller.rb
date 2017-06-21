class GamesController < ApplicationController
  before_action :check_current_user
  around_action :create_nations, only: [:create]

  def create
    @game = current_user.games.new(game_params)
    @game.update(user_uuid: current_user.uuid)
    session[:game_uuid] = @game.uuid
    redirect_to game_path
  end

  def show
    session[:game_uuid] = @game.uuid 
  end

  private
  def check_current_user
    if !current_user
      redirect_to root_path
    end
  end

  def game_params
    params.require(:game).permit(:game_name)
  end

  def create_nations
    if @game.game_name == "Global 1940"
      AAA::Nations.create_1940(@game.uuid)
    ends

end
