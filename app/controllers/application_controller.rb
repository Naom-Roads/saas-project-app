class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token #need to discuss another way to fix invalid auth token
  before_action :authenticate_user!


end
