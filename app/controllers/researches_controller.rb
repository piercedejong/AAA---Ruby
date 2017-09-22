class ResearchesController < ApplicationController

  def show
    @game = Game.find_by(uuid: params[:id])
  end

  def clicked
    @research = current_game.nations.find_by(name: params[:name]).researches.find_by(ridL params[:id])
    

end
