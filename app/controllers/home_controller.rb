class HomeController < ApplicationController
before_action :authenticate_tenant!
protect_from_forgery with: :exception

  def index
  end
end
