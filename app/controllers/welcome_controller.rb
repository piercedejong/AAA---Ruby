class WelcomeController < ApplicationController
  before_action :detect_iphone

  def index
    if current_user.nil?
      @user = User.new
    end

    respond_to do |format|
      format.html.erb               # /app/views/home/index.html.erb
      format.html.phone        # /app/views/home/index.html+phone.erb
    end
  end



  private
  def detect_iphone
    request.variant = :iphone if request.user_agent =~ /iPhone/
  end

end
