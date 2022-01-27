class UserController < ApplicationController

  def show
    user = current_user
    @tracked_tickets = current_user.tickets
  end

  def edit

  end

end