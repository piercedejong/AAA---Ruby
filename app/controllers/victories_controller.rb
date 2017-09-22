class VictoriesController < ApplicationController

  def show
    @game = Game.find_by(uuid: params[:id])
  end

  def clicked

  end
end
