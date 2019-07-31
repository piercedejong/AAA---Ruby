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
    @bc = current_user.battle_calculator
    update_units
    update_bc
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
    end

    def water_battle
    end

    def amphibious_battle
    end

    def update_units
      a = params[:attacker]
      @bc.teams.first.units.all.zip(a).each do |x|
        x.first.update(count:x.second.second)
      end
      d = params[:defender]
      @bc.teams.second.units.all.zip(d).each do |x|
        x.first.update(count:x.second.second)
      end
      binding.pry
    end

    def update_bc
      @bc.update(current_simulation:1)
      @bc.update(current_round:1)
      # @bc.update(max_simulations:params[:maxsimulations])
      # @bc.update(max_round:params[:maxround])
      @bc.update(winner:"")
      @bc.teams.all.each do |t|
        t.update(wins:0)
        t.update(loses:0)
        t.update(starting_land:0)
        t.update(starting_air:0)
        t.update(starting_water:0)
        count = 0
        t.units.all.each do |u|
          count = count + u.count
        end
        t.update(starting_units:count)
      end
    end

    def battle_calculator_params
      params.require(:battle_calculator).permit(:game_version,:battle_type)
    end
end
