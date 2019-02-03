class UsersController < ApplicationController

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
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
      cookies.permanent.signed[:permanent_user_id] = @user.id
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  def index
    @user = User.find(params[:id])
  end

  def toggle_background
    current_user.update(sepia: !current_user.sepia)
    if request.xhr?
      render :json => {
        sepia: current_user.sepia
      }
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end


  def new
  end
end
