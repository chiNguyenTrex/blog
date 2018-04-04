class BooksController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :load_book, only: [:show, :edit, :update, :destroy]
  before_action :load_genres, only: [:new, :edit]

  def index
    @search = Book.ransack params[:q]
    @books = @search.result.includes :genre, :author
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def show
    @comment = Comment.new
  end

  def create
    @book = current_user.books.new book_params
    if @book.save
      flash[:success] = "New book was instantiated successfully!"
      redirect_to books_path
    else
      load_genres
      flash.now[:danger] = "There's something wrong!"
      render :new
    end
  end

  def update
    if @book.update_attributes(book_params)
      flash[:success] = "Book updated successfully"
      redirect_to books_path
    else
      load_genres
      flash.now[:danger] = "There's something wrong!"
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = "Book deleted successfully"
      redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit :name, :genre_id
  end

  def load_book
    @book = Book.find params[:id]
  end

  def load_genres
    @genres = Genre.all
  end
end
