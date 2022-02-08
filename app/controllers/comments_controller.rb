class CommentsController < ApplicationController
  before_action :require_user

  def index
    @comments = Comment.all
  end

  def show
    @ticket = Ticket.find(params[:id])
    @comment = @ticket.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
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
    params.require(:comment).permit(:id, :subject, :body, :username, :ticket_id)
    # can I include params from other objects like this?
  end


end
