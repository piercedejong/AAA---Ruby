class NationsController < ApplicationController
  before_action :check_current_user

  def show
    @nation = current_game.nations.find_by(uuid: params[:id])
    current_game.update(eco: @nation.nid)
  end

  def clicked
    @objective = current_eco.objectives.find_by(oid: params[:id])
    if @objective.enabled
      @objective.update(enabled: false)
      current_eco.update(obj_income: current_eco.obj_income - @objective.value)
      @color = current_eco.colorL
    else
      @objective.update(enabled: true)
      current_eco.update(obj_income: current_eco.obj_income + @objective.value)
      @color = current_eco.color
    end

    if request.xhr?
      render :json => {
        color: @color,
        nation: current_eco.obj_inc
      }
    end
  end


  private
  def check_current_user
    if !current_user
      redirect_to root_path
    end
  end
end
