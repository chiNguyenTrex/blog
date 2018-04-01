class ArticlesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :load_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new article_params
    if @article.save
      flash[:success] = "New article was created successfully!"
      redirect_to @article
    else
      flash.now[:danger] = "There something wrong, please check again!"
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      flash[:success] = "Article updated successfully"
      redirect_to articles_path
    else
      flash.now[:danger] = "There's something wrong"
      render :edit
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = "Article deleted successfully"
      redirect_to articles_path
    end
  end

  private

  def article_params
    params.require(:article).permit :title, :text
  end

  def load_article
    @article = Article.find(params[:id])
  end
end
