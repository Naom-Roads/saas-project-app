class DashboardController < ApplicationController

  # def index
  #   @user = current_user
  #   @tracked_tickets = current_user.tickets
  # end consider using this for admin view
  def index

  end

  def show
    @user = current_user
    @tracked_tickets = @user.tickets
  end



  def destroy
    super
  end

  def edit

  end

end