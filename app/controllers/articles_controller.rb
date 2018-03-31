class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
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
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  private
  def article_params
    params.require(:article).permit :title, :text
  end
end
