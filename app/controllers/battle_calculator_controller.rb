class BattleCalculatorController < ApplicationController

  def index
    if !current_user
      redirect_to root_path
    end
    @battle_calculator = current_user.battle_calculator
  #  (1..6).to_a.shuffle.first
  end

  def simulation; body; end;
end
