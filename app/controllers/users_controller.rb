class UsersController < ApplicationController

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first
  end

  def new
    @user = User.new
  end

  def create
      # User is created by signing up
      if auth_hash.nil?
        @user = User.new(user_params)
        respond_to do |format|
          if @user.save
            cookies.permanent.signed[:permanent_user_id] = @user.uuid
            session[:user_id] = @user.uuid
            @battle = BattleCalculator.create
            @battle.update(user_id: @user.id)
            format.html { redirect_to root_path }
          else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      # User is using google to sign up / log in
      else
        # If user can not be find by email then create a new user
        if !(User.find_by(email: auth_hash.info.email))
          @user = User.new
          @user.update(email: auth_hash.info.email)
          @user.update(name: auth_hash.info.name)
          @user.update(password_digest: "google")
          @battle = BattleCalculator.create
          @battle.update(user_id: @user.id)
          #@user = User.create_user(auth_hash)
        # else find the user by email
        else
          @user = User.find_by(email: auth_hash.info.email)
        end
        # Kepp the user signed in at all times
        cookies.permanent.signed[:permanent_user_id] = @user.uuid
        session[:user_id] = @user.uuid
        # Go back to root path
        redirect_to root_path
      end
  end

  def index
    if current_user
      @users = User.all
    else
      redirect_to signup_path
    end
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
