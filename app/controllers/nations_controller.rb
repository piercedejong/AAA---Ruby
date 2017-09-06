class NationsController < ApplicationController

  def show
    @nation = current_game.nations.find_by(uuid: params[:id])
    current_game.update(eco: @nation.nid)
  end

  def update_obj
    @objective = current_eco.objectives.find_by(oid: params[:id])
    if @objective.enabled
      @objective.update(enabled: false)
      current_eco.update(income: current_eco.income - @objective.value)
      if request.xhr?
        render :json => {
          color: current_eco.colorL,
          oid: params[:id]
        }
      end
    else
      @objective.update(enabled: true)
      current_eco.update(income: current_eco.income + @objective.value)
      if request.xhr?
        render :json => {
          color: current_eco.color,
          oid: params[:id]
        }
      end
    end
  end
end
