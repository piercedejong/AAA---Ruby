class UsersController < ApplicationController

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    user
  end

  def create
    if params[:denied]
      redirect_to sessions_path
    else
      if !(User.find_by(email: auth_hash.info.email))
        @user = User.create_user(auth_hash)
      else
        @user = User.find_by(email: auth_hash.info.email)
      end
      session[:user_id] = @user.id
      redirect_to home_path
    end
  end

  def index
    @user = User.find(params[:id])
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end


  def new
  end
end
