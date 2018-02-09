class NationsController < ApplicationController

  def show
    @nation = current_game.nations.find_by(uuid: params[:id])
    current_game.update(eco: @nation.nid)
  end

  def update_obj
    @objective = current_eco.objectives.find_by(oid: params[:id])
    if @objective.enabled
      @objective.update(enabled: false)
      current_eco.update(obj_income: current_eco.obj_income - @objective.value)
      if request.xhr?
        render :json => {
          color: current_eco.colorL,
          nation: current_eco.obj_inc
        }
      end
    else
      @objective.update(enabled: true)
      current_eco.update(obj_income: current_eco.obj_income + @objective.value)
      if request.xhr?
        render :json => {
          color: current_eco.color,
          nation: current_eco.obj_inc
        }
      end
    end
  end
end
