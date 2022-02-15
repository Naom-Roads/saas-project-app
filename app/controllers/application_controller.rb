class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit create destroy]

  def set_user
    @user = current_user
  end
  
end
