class UsersController < ApplicationController

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
  end

  def new
    @user = User.new
  end

  def create
    if params[:denied]
      redirect_to sessions_path
    else
      if auth_hash.nil?
        @user = User.new(user_params)
        @user.save
      else
        if !(User.find_by(email: auth_hash.info.email))
          @user = User.new
          @user.update(email: auth_hash.info.email)
          @user.update(name: auth_hash.info.name)
          @user.update(password_digest: "google")
          #@user = User.create_user(auth_hash)
        else
          @user = User.find_by(email: auth_hash.info.email)
        end
      end
      cookies.permanent.signed[:permanent_user_id] = @user.id
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  def index
    #@user = User.find(params[:id])
    @users = User.all
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

  private

  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
