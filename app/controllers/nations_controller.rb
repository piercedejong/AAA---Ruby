class NationsController < ApplicationController

  def show
    @nation = current_game.nations.find_by(uuid: params[:id])
  end

end
