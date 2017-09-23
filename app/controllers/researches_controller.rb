class ResearchesController < ApplicationController

  def show
    @game = Game.find_by(uuid: params[:id])
  end

  def clicked
    @nation = current_game.nations.find_by(name: params[:name])
    @research = @nation.researches.find_by(rid: params[:id])
    if session[:research_point]
      session[:research_point] = false
      @research.update(enabled: true)
      if request.xhr?
        render :json => {
          color: @nation.color,
          id: @nation.name+"-"+params[:id]
        }
      end
    end

  end
end
