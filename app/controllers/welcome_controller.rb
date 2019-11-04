class WelcomeController < ApplicationController

  def index
    if current_user.nil?
      @user = User.new
    end
  end

end
