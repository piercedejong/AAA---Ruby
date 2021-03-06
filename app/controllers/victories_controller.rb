class VictoriesController < ApplicationController
  before_action :check_current_user

  def show
    @game = Game.find_by(uuid: params[:id])
  end

  def clicked
    @victory = current_game.victories.find_by(vid: params[:id])
    if !@victory.enabled
      session[:research_point] = true
      @victory.update(enabled: true)
      if @victory.axis
        session[:research_team] = "axis"
      else
        session[:research_team] = "allies"
      end
      if request.xhr?
        render :json => {
          uuid: current_game.uuid
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
