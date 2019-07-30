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
      @battle_calculator.teams.first.units.destroy_all
      @battle_calculator.teams.second.units.destroy_all
      if battle_calculator_params[:game_version].eql?"1940"
        if battle_calculator_params[:battle_type].eql? "land"
          Unit.create_1940Land(@battle_calculator.teams.first)
          Unit.create_1940Land(@battle_calculator.teams.second)
        elsif battle_calculator_params[:battle_type].eql? "water"
          Unit.create_1940Water(@battle_calculator.teams.first)
          Unit.create_1940Water(@battle_calculator.teams.second)
        else
          Unit.create_1940Amphibious(@battle_calculator.teams.first)
          Unit.create_1940Amphibious(@battle_calculator.teams.second)
        end
      elsif battle_calculator_params[:game_version].eql?"1942"

      else

      end
      redirect_to battle_calculator_index_path
    else
      redirect_to battle_calculator_index_path
    end
  end

  def simulation
    binding.pry
    @bc = current_user.battle_calculator
    if @bc.battle_type.eql? "land"
      land_battle
    elsif @bc.battle_type.eql? "water"
      water_battle
    else
      amphibious_battle
    end
  end




  private
    def land_battle
      # binding.pry
    end

    def water_battle
    end

    def amphibious_battle
    end

    def battle_calculator_params
      params.require(:battle_calculator).permit(:game_version,:battle_type)
    end
end
