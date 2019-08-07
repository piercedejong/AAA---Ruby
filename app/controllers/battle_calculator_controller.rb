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
    @attacker = @bc.teams.first
    @defender = @bc.teams.last
    update_starting_units
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
      #while @attacker.current_units > 0 && @defender.current_units > 0
        round
      #end
    end

    def water_battle
    end

    def amphibious_battle
    end


    def round
      @attacker_hits = team_roll(@attacker)
      @defender_hits = team_roll(@defender)

      @attacker = team_hits(@defender_hits, @attacker)
      @defender = team_hits(@attacker_hits, @defender)

    end


    def team_roll(team)
      hits = 0
      team.units.all.each do |u|
        x = 0
        while x < u.count
          r = roll
          if r <= u.attack
            hits += 1
          end
          x = x+1
        end
      end
      return hits
    end

    # Removes the amount of units from the hits starting with inf and ending with bombers
    def team_hits(hits, team)
      if team.current_units <= hits
        team.units.all.each do |u|
          u.update(count:0)
        end
      else
        u = team.units.first
        binding.pry
        while hits > 0 and team.current_units > 0
          if u.count > 0 and hits > 0
            u.update(count: u.count-1)
            hits-=1
          else
            u = u.next
          end
        end
        return team
      end



    end

    def update_starting_units
      a = params[:attacker]
      @attacker.units.all.zip(a).each do |x|
        x.first.update(count:x.second.second)
      end
      d = params[:defender]
      @defender.units.all.zip(d).each do |x|
        x.first.update(count:x.second.second)
      end
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

    # Roll a 6 sided dice
    def roll
      return 1 + rand(6)
    end

    def battle_calculator_params
      params.require(:battle_calculator).permit(:game_version,:battle_type)
    end
end
