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

    def current_user
      @current_user ||= (User.find(session[:user_id]) if session[:user_id])
    end

    def current_game
      @current_game ||= current_user.games.find_by(uuid: session[:game_uuid]) if session[:game_uuid]
    end

    def current_nation
      @current_nation ||= current_game.nations.find_by(nid: current_game.current)
    end

    def current_eco
      @current_eco ||= current_game.nations.find_by(nid: current_game.eco)
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

    protect_from_forgery with: :exception
end
