class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_game
  helper_method :current_nation
  helper_method :current_eco
  helper_method :next_nation
  helper_method :prev_nation
  helper_method :next_eco
  helper_method :prev_eco
  helper_method :objective_income
  helper_method :display_end_turn
  helper_method :display_buy_pacific
  helper_method :check_britain_economy
  helper_method :is_1940_game
  helper_method :is_victories_game
  helper_method :title
  
    def current_user
      return unless cookies.signed[:permanent_user_id] || session[:user_id]
      #@current_user ||= (User.find(session[:user_id]) if session[:user_id])
      begin
        @current_user ||= User.find_by(uuid: cookies.signed[:permanent_user_id] || session[:user_id])
      rescue Mongoid::Errors::DocumentNotFound
        nil
      end
    end

    def current_game
      @current_game ||= current_user.games.find_by(uuid: session[:game_uuid]) if session[:game_uuid]
    end

    def current_nation
      @current_nation = current_game.nations.find_by(nid: current_game.current)
    end

    def current_eco
      @current_eco = current_game.nations.find_by(nid: current_game.eco)
    end

    def next_nation
      @next_nation = current_game.nations.find_by(nid: current_game.current+1).nil? ? current_game.nations.first : current_game.nations.find_by(nid: current_game.current+1)
    end

    def prev_nation
      @prev_nation = current_game.nations.find_by(nid: current_game.current-1).nil? ? current_game.nations.last : current_game.nations.find_by(nid: current_game.current-1)
    end

    def next_eco
      @next_nation = current_game.nations.find_by(nid: current_game.eco+1).nil? ? current_game.nations.first : current_game.nations.find_by(nid: current_game.eco+1)
    end

    def prev_eco
      @prev_nation = current_game.nations.find_by(nid: current_game.eco-1).nil? ? current_game.nations.last : current_game.nations.find_by(nid: current_game.eco-1)
    end

    def objective_income
      @objective_income = 0
      current_eco.objectives.all.each do |x|
        @objective_income = @objective_income + x.value
      end
      return @objective_income
    end

    def display_buy_pacific
      if !check_britain_economy
        return "display:none"
      end
      if check_britain_economy and !["Britain","United Kingdom"].include? current_nation.name
        return "display:none"
      else
        return ""
      end
    end

    def display_end_turn
      if check_britain_economy and ["Britain","United Kingdom"].include? current_nation.name
        return "display:none"
      else
        return ""
      end
    end

    def check_britain_economy
      if ["1940Global","1940Grasshopper","1940House"].include? current_game.game_name
        return true
      else
        return false
      end
    end

    def is_1940_game
      if ["1940Global","1940OneEco","1940Pacific","1940Europe","1940Grasshopper","1940House"].include? current_game.game_name
        return true
      else
        return false
      end
    end

    def is_victories_game
      if ["1940Grasshopper","1940House"].include? current_game.game_name
        return true
      else
        return false
      end
    end

    def title
      return "Axis and Allies Economy"
    end



    protect_from_forgery with: :exception
end
