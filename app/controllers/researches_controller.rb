class ResearchesController < ApplicationController

  def show
    @game = Game.find_by(uuid: params[:id])
  end

  def clicked
    @nation = current_game.nations.find_by(name: params[:name])
    @research = @nation.researches.find_by(rid: params[:id])
    if current_game.game_name.eql? "Grasshopper"
      if session[:research_point]
        session[:research_point] = false
        @research.update(enabled: true)
        if @nation.name.eql? "Britain"
          current_game.nations.find_by(name: "Pacific").researches[@research.rid].update(enabled: true)
        end
        if request.xhr?
          render :json => {
            color: @nation.color,
            id: @nation.name+"-"+params[:id]
          }
        end
      end
    elsif ["1940","1940Europe","1940Pacifc"].include? current_game.game_name
      @research.update(enabled: true)
      if @nation.name.eql? "Britain"
        current_game.nations.find_by(name: "Pacific").researches[@research.rid].update(enabled: true)
      end
      if request.xhr?
        render :json => {
          color: @nation.color,
          id: @nation.name+"-"+params[:id]
        }
      end
    end
  end
end
