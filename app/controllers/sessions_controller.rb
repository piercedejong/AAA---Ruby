class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to root_path
    end
    render :layout => false
  end

  def failure
    redirect_to root_path, notice: "Sorry, but you didn't allow access to our app!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :alert => "Logged out!"
  end

end
