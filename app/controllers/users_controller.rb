class UsersController < ApplicationController

  def index
    @user = current_user
    @tracked_tickets = current_user.tickets
  end

  def show
    @user = User.find(params[:id])
    @tracked_tickets = @user.tickets
  end

  def edit

  end

end