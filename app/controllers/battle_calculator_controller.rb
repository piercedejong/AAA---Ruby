class BattleCalculatorController < ApplicationController

  def index
    if !current_user
      redirect_to root_path
    end
  end

  def simulation; body; end;
end
