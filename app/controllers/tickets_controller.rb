class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit create destroy]

  # GET /tickets or /tickets.json
  # if user is an admin they can see all tickets otherwise user_path only shows tickets that belong to user
  def index
    if current_user.admin?
      @tickets = Ticket.all
    else
      redirect_to user_path(current_user)
    end
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])
    @comment = Comment.new
    @comments = @ticket.comments
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    @ticket.ticket_status = "New" if @ticket.ticket_status.nil?
    if @ticket.save
      flash[:notice] = "Ticket was successfully created."
      redirect_to ticket_url(@ticket)
      return
    else
      flash.now[:alert] = "Ticket could not be created, please try again"
      render :new
      return
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_user
    @user = current_user
  end


  def ticket_params
    params.require(:ticket).permit(:id, :ticket_number, :subject, :description, :ticket_status)
  end

end
