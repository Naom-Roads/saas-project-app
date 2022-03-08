class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[show create update_status]
  # after_action :update_status, only: %i[create]

  def index
    @comments = Comment.all
  end

  def show
    @comment = @ticket.comments.order(created_at: :desc)
  end

  def new
    @comment = Comment.new
  end

  def edit

  end


  def create
    @comment = @ticket.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      UserMailer.ticket_comment_email(@user, @ticket).deliver_now
      redirect_to ticket_url(@ticket)
    else
      flash.now[:alert] = "Message could not be sent, please try again"
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user || @user.admin?
      @comment.destroy
      redirect_to @comment.ticket
      flash[:notice] = "Comment was successfully destroyed."
    else
      flash[:alert] = "You cannot delete the messages of other users"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :subject)
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def update_status
    @ticket.ticket_status = if (@ticket.ticket_status = 'New') || (@ticket.ticket_status.nil?) && @user.admin?
      'In Progress'
                            else
      'Waiting on Customer'
                            end
  end
end