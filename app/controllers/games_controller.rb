class GamesController < ApplicationController
  before_action :check_current_user

  def create
    @game = current_user.games.new(game_params)
    @game.update(user_uuid: current_user.uuid)
    redirect_to game_path
  end

  def show
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

end
