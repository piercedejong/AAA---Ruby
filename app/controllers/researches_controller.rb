class ResearchesController < ApplicationController

  def show
    @game = Game.find_by(uuid: params[:id])
  end

  def clicked
    @nation = current_game.nations.find_by(name: params[:name])
    @research = @nation.researches.find_by(rid: params[:id])
    if current_game.game_name.eql? "GrassHopper"
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
    elsif current_game.game_name.eql? "1940"
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
