class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user.password_digest.eql? "google"
      redirect_to home_path
      flash.now[:alert] = "Account was made with google"
    elsif @user && @user.authenticate(params[:password])
      cookies.permanent.signed[:permanent_user_id] = @user.uuid
      session[:user_id] = @user.uuid
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end



  def failure
    redirect_to root_path, notice: "Sorry, but you didn't allow access to our app!"
  end

  def destroy
    cookies.permanent.signed[:permanent_user_id] = nil
    session[:user_id] = nil
    redirect_to root_path, :alert => "Logged out!"
  end
end
