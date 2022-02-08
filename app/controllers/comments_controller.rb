class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket

  def index
    @comments = Comment.all
  end

  def show
    @comment = @ticket.comments.order(created_at: :desc)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @ticket.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to ticket_url(@ticket)
      return
    else
      flash.now[:alert] = "Message could not be sent, please try again"
      render :new
      return
    end
  end

  def destroy

  end


  private


  def comment_params
    params.require(:comment).permit(:body, :ticket_id)
    # can I include params from other objects like this?
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

end
