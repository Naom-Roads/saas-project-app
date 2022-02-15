class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[show]

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
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url(@ticket), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private



  def comment_params
    params.require(:comment).permit(:body, :subject)
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

end
