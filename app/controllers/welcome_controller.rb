class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to home_path
    end
  end

  def show
    if !current_user
      redirect_to root_path
    end
  end
end
