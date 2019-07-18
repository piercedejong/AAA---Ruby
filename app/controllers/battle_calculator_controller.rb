class BattleCalculatorController < ApplicationController

  def index
    if !current_user
      redirect_to root_path
    end
    @battle_calculator = current_user.battle_calculator
  #  (1..6).to_a.shuffle.first
  end

  def update
    @battle_calculator = current_user.battle_calculator
    if @battle_calculator.update_attributes(battle_calculator_params)
      redirect_to battle_calculator_index_path
    else
      redirect_to battle_calculator_index_path
    end
  end

  def simulation

  end




  private
    def battle_calculator_params
      params.require(:battle_calculator).permit(:game_version,:battle_type)
    end
end
