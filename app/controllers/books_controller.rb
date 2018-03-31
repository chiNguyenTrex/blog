class BooksController < ApplicationController
  before_action :load_book, only: [:show, :edit, :update]
  def index
    @books = Book.all
  end

  def new
    @genres = Genre.all
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
      @genres = Genre.all
      flash.now[:danger] = "There's something wrong!"
      render :new
    end
  end

  def update
  end

  private

  def book_params
    params.require(:book).permit :name, :genre_id
  end

  def load_book
    @book = Book.find params[:id]
  end
end
