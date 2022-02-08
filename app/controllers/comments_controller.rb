class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_username
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
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url(@ticket), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_username
    @user = current_user
    @user.username.nil? ? @user.username = @user.email.split('@')[0].capitalize : @user.username
  end

  def comment_params
    params.require(:comment).permit(:id, :body, :subject, :ticket_id, :user_id)
    # can I include params from other objects like this?
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

end
