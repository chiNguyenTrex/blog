class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def create
    @comment = current_user.comments.new(comment_params.merge commentable: commentable)
    respond_to do |format|
      if @comment.save
        format.js
      end
    end
  end

  def edit
    @commentable = commentable
    @comment = Comment.find params[:id]
    respond_to {|format| format.js}
  end

  def update
    @comment = Comment.find params[:id]
    @commentable = commentable
    respond_to do |format|
      if @comment.update_attributes(comment_params)
        format.js
      else
        format.js {render :edit}
      end
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
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
