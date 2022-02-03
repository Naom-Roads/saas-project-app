class CommentsController < ApplicationController
  before_action :require_user

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create



  end

  def destroy

  end


  private


  def comment_params
    params.require(:comment).permit(:id, :ticket_number, :subject, :body, :ticket_status)
    # can I include params from other objects like this?
  end


end
