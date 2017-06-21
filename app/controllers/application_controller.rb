class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_game

    def current_user
      @current_user ||= (User.find(session[:user_id]) if session[:user_id])
    end

    def current_game
      @current_game ||= current_user.games.find_by(uuid: session[:game_uuid]) if session[:game_uuid]
    end

    protect_from_forgery with: :exception
end
