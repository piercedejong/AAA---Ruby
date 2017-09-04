class NationsController < ApplicationController

  def show
    @nation = current_game.nations.find_by(uuid: params[:id])
  end

  def previous
    @uuid = params[:uuid]
    current_game.update(eco: current_game.eco-1)
    if current_game.eco<0
      current_game.update(eco: current_game.nations.last.nid)
    end
    redirect_to nation_path()
  end
end
