class ResearchesController < ApplicationController

  def show
    @game = Game.find_by(uuid: params[:id])
  end
  
end
