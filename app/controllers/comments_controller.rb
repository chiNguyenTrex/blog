class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def create
    @comment = current_user.comments.new comment_params
    if @comment.save
      redirect_to commentable
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge commentable: commentable
  end

=begin

  def commentable
    if params[:book_id].present?
      Book.find params[:book_id]
    elsif params[:article_id].present?
      Article.find params[:article_id]
    elsif params[:event_id].present?
      Event.find params[:event_id]
    end
  end

=end

  # Better version of 'commentable'
  def commentable
    resource, id = request.path.split("/")[1, 2]
    resource.singularize.classify.constantize.find_by(id: id)
  end
end
