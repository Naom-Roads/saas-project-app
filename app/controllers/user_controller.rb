class UserController < ApplicationController

  # def index
  #   @user = current_user
  #   @tracked_tickets = current_user.tickets
  # end consider using this for admin view

  def dashboard
    @user = current_user
    @tracked_tickets = @user.tickets
  end

  def destroy
    super
  end

  def edit

  end

end