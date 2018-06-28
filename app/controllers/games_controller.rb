class GamesController < ApplicationController
  before_action :check_current_user
  # before_action :next_nation, only: [:show, :end_turn]

  def create
    @game = current_user.games.new(game_params)
    @game.update(user_uuid: current_user.uuid)
    if @game.save
      create_game
      session[:game_uuid] = @game.uuid
      current_game.update(bank: current_nation.bank)
      redirect_to game_path(@game.uuid)
    else
      render 'new'
    end
  end

  def new
    @game = current_user.games.new
  end

  def edit
    @game = current_user.games.find_by(uuid: params[:id])
    session[:edit_uuid] = params[:id]
  end

  def update
    @game = current_user.games.find_by(uuid: session[:edit_uuid])
    @game.update(name: params[:game][:name])
    redirect_to games_path
  end

  def copy
    @new = current_user.games.find_by(uuid: params[:uuid]).dup
    @new.update(name: params[:name])
    redirect_to games_path
  end

  def destroy
    @game = current_user.games.find_by(uuid: params[:id])
    @game.nations.all.each {|n| n.destroy}
    @game.units.all.each {|u| u.destroy}
    @game.destroy
    if request.xhr?
      render json: {
      }
    end
    redirect_to games_path
  end

  def destroy_all
    current_user.games.all.each {|g| g.destroy}
    redirect_to games_path
  end

  def show
    @game = current_user.games.find_by(uuid: params[:id])
    session[:game_uuid] = @game.uuid
  end

  def end_turn
    @cheaper = false
    @pacific = false
    # If the cheaper naval units is eneabled for the enxt nation
    next_nation.researches.all.each do |r|
      if ["Mass Production", "Improved Shipyards"].include? r.name and r.enabled
        @cheaper = true
      end
    end

    if(["Britain","United Kingdom"].include? next_nation.name and ["Pacific","FEC", "UK  Pacfic"].include? current_game.nations[next_nation.nid+1].name)
      @pacific = true
    end
    current_nation.end_turn
    # IF nation is britain and pacific is next nation (i.e Did not buy for Pacific)
    if ["Britain","United Kingdom"].include? current_nation.name and ["Pacific","UK Pacific","FEC"].include? next_nation.name
      if true
        # Move to pacific
        current_game.update(current: current_game.current+1)
        # End pacific turn
        current_nation.end_turn
        if request.xhr?
          render :json => {
            oo_nation: prev_nation.name,
            oo_bank: prev_nation.bank,
            o_nation: current_game.nations.find_by(nid: current_game.current).name,
            o_bank: current_game.nations.find_by(nid: current_game.current).bank,
            nation: next_nation.name,
            color: next_nation.color,
            colorL: next_nation.colorL,
            bank: next_nation.bank,
            income: next_nation.income,
            roundel: next_nation.roundel,
            uuid: next_nation.uuid,
            cheaper: @cheaper,
            pacific: @pacific
          }
        end
      end

    elsif ["Pacific","UK Pacific","FEC"].include? current_nation.name
      prev_nation.end_turn
      if request.xhr?
        render :json => {
          oo_nation: prev_nation.name,
          oo_bank: prev_nation.bank,
          o_nation: current_game.nations.find_by(nid: current_game.current).name,
          o_bank: current_game.nations.find_by(nid: current_game.current).bank,
          nation: next_nation.name,
          color: next_nation.color,
          colorL: next_nation.colorL,
          bank: next_nation.bank,
          income: next_nation.income,
          roundel: next_nation.roundel,
          uuid: next_nation.uuid,
          cheaper: @cheaper,
          pacific: @pacific
        }
      end
    else
      if request.xhr?
        render :json => {
          o_nation: current_nation.name,
          o_bank: current_nation.bank,
          nation: next_nation.name,
          color: next_nation.color,
          colorL: next_nation.colorL,
          bank: next_nation.bank,
          income: next_nation.income,
          roundel: next_nation.roundel,
          uuid: next_nation.uuid,
          cheaper: @cheaper,
          pacific: @pacific
        }
      end
    end
    #Go to the next nation
    current_game.end_turn
  end

  # Buy British Pacific Units in Global Games
  def buy_pacific
    current_game.buy_pacific
    if request.xhr?
      render :json => {
        nation: current_nation.name,
        color: current_nation.color,
        colorL: current_nation.colorL,
        bank: current_nation.bank,
        income: current_nation.income,
        roundel: current_nation.roundel,
        uuid: current_nation.uuid
      }
    end
  end

  def buy_unit
    @change = false
    @unit = current_game.units.find_by(uid: params[:uid])
    current_nation.buy_unit(@unit)
    if current_eco!=current_nation
      current_game.eco_to_current
      @change = true
    end
    if request.xhr?
      render :json => {
        count: @unit.count,
        name: params[:uid],
        nation: current_nation.name,
        bank: current_nation.bank,
        income: current_nation.income,
        color: current_nation.color,
        colorL: current_nation.colorL,
        change: true
      }
    end
  end

  def change_eco
    current_game.change_eco
    if request.xhr?
      render :json => {
        nation: current_eco.name,
        color: current_eco.color,
        colorL: current_eco.colorL,
        bank: current_eco.bank,
        income: current_eco.income,
        uuid: current_eco.uuid
      }
    end
  end

  def change_bank
    @amount = params[:amount].to_i
    current_eco.update(bank: current_eco.bank+@amount)
    if(current_eco.bank<0)
      current_eco.update(bank: 0)
    end
    if current_eco==current_nation
      if request.xhr?
        render :json => {
          nation: current_eco.name,
          bank: current_eco.bank,
          same_n: true
        }
      end
    else
      if request.xhr?
        render :json => {
          nation: current_eco.name,
          bank: current_eco.bank,
          same_n: false
        }
      end
    end
  end

  def change_income
    @amount = params[:amount].to_i
    current_eco.update(income: current_eco.income+@amount)
    if(current_eco.income<0)
      current_eco.update(income: 0)
    end
    if request.xhr?
      render :json => {
        nation: current_eco.name,
        income: current_eco.income,
        total_income: current_eco.total_income
      }
    end
  end

  def edit_change_bank
    @nation = current_user.games.find_by(uuid: session[:edit_uuid]).nations.find_by(uuid: params[:uuid])
    @amount = params[:amount].to_i
    @nation.update(bank: @nation.bank+@amount)
    if(@nation.bank<0)
      @nation.update(bank: 0)
    end
    if request.xhr?
      render :json => {
        bank: @nation.bank
      }
    end
  end

  def edit_change_income
    @nation = current_user.games.find_by(uuid: session[:edit_uuid]).nations.find_by(uuid: params[:uuid])
    @amount = params[:amount].to_i
    @nation.update(income: @nation.income+@amount)
    if(@nation.income<0)
      @nation.update(income: 0)
    end
    if request.xhr?
      render :json => {
        income: @nation.income
      }
    end
  end

  def reset_buy
    current_game.reset_units
    current_nation.update(bank: current_game.bank)
    if request.xhr?
      render :json => {
        nation: current_nation.name,
        bank: current_nation.bank,
      }
    end
  end

  def reset_victory_research
    current_game.victories.each do |v|
      v.update(enabled: false)
    end
    current_game.nations.each do |n|
      n.researches.each do |r|
        r.update(enabled: false)
      end
    end
    if request.xhr?
      render :json => {
      }
    end
  end

  private

  def check_current_user
    if !current_user
      redirect_to root_path
    end
  end

  def game_params
    params.require(:game).permit(:game_name, :name)
  end

  def create_game
    case @game.game_name
    when "1940Global"
      Nation.create_1940(@game)
      Unit.create_1940(@game)
      Special.create_1940(@game)
      Objective.create_1940(@game)
      Research.create_1940(@game)
    when "1940House"
      Nation.create_1940_house(@game)
      Unit.create_1940_house(@game)
      Special.create_1940_house(@game)
      Objective.create_1940_house(@game)
      Research.create_1940_house(@game)
      Victory.create_1940_grasshopper(@game)
    when "1940OneEco"
      Nation.create_1940_one_eco(@game)
      Unit.create_1940(@game)
      Special.create_1940(@game)
      Objective.create_1940_one_eco(@game)
      Research.create_1940(@game)
    when "1940Pacific"
      Nation.create_1940_pacific(@game)
      Unit.create_1940(@game)
      Special.create_1940(@game)
      Objective.create_1940_pacific(@game)
      Research.create_1940(@game)
    when "1940Europe"
      Nation.create_1940_europe(@game)
      Unit.create_1940(@game)
      Special.create_1940(@game)
      Objective.create_1940_europe(@game)
      Research.create_1940(@game)
    when "1940Grasshopper"
      Nation.create_1940_grasshopper(@game)
      Unit.create_1940(@game)
      Special.create_1940(@game)
      Objective.create_1940_grasshopper(@game)
      Victory.create_1940_grasshopper(@game)
      Research.create_1940_grasshopper(@game)
    when "1942"
      Nation.create_1942(@game)
      Unit.create_1942(@game)
    when "1914"
      Nation.create_1914(@game)
      Unit.create_1914(@game)
    else
    end
  end
end
