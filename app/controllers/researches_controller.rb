class ResearchesController < ApplicationController
  before_action :check_current_user
  def show
    @game = Game.find_by(uuid: params[:id])
  end

  def clicked
    @nation = current_game.nations.find_by(name: params[:name])
    @research = @nation.researches.find_by(rid: params[:id])
    if current_game.game_name.eql? "1940Grasshopper"
      #If a victory mission was completed
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
    elsif ["1940Global","1940OneEco","1940Europe","1940Pacifc"].include? current_game.game_name
      @research.update(enabled: true)
      if @nation.name.eql? "Britain" and current_game.game_name.eql? "1940Global"
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
  
  private
  def check_current_user
    if !current_user
      redirect_to root_path
    end
  end
end
