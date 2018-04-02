class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.js
      end
    end
  end

  def edit
    @commentable = commentable
    #@comment = Comment.find params[:id] no need this because: load_and_authorize_resource
    respond_to {|format| format.js}
  end

  def update
    @commentable = commentable
    respond_to do |format|
      if @comment.update_attributes(udpate_params)
        format.js
      else
        format.js {render :edit}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.js
      end
    end
  end

  private

  def create_params
    params.require(:comment).permit(:content).merge commentable: commentable
  end

  def udpate_params
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
