class GameDataController < ApplicationController
  def create
    @game = current_user.game_data.new(game_params)
    @game.update(user_uuid: current_user.uuid)

  end
end
