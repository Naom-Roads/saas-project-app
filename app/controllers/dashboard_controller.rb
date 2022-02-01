class DashboardController < ApplicationController


  def index
    @user = current_user
  end

  def show
    @user = current_user
    @tickets = @user.tickets
  end

  def destroy
    super
  end

  def edit
  end

end