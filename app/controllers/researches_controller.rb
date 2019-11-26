class ResearchesController < ApplicationController
  before_action :check_current_user

  helper_method :disable_checkbox
  def show
    @game = Game.find_by(uuid: params[:id])
  end

  def clicked
    @nation = current_game.nations.find_by(name: params[:name])
    @research = @nation.researches.find_by(rid: params[:id])
    if is_victories_game
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
            id: @nation.name+"-"+params[:id],
            disable: true
          }
        end
      end
    else
      @research.update(enabled: true)
      if @nation.name.eql? "Britain" and current_game.game_name.eql? "1940Global"
        current_game.nations.find_by(name: "Pacific").researches[@research.rid].update(enabled: true)
      end
      if request.xhr?
        render :json => {
          color: @nation.color,
          id: @nation.name+"-"+params[:id],
          disable: false
        }
      end
    end
  end

  def disable_checkbox(n)
    puts n.name
    if is_victories_game
      if session[:research_point]
        if session[:research_team] == "axis"
          if ["Germany","Japan","Italy"].include? n.name
            return false
          else
            return true
          end
        else
          if ["USSR","USA","ANZAC","Britain"].include? n.name
            return false
          else
            return true
          end
        end
        return false
      else
        return true
      end
    else
      return false
    end
  end

  private
  def check_current_user
    if !current_user
      redirect_to root_path
    end
  end
end
