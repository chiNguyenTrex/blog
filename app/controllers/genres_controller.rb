class GenresController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :load_genre, only: [:show, :edit, :update, :destroy]

  def index
    @genres = Genre.all
  end

  def show
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new genre_params
    if @genre.save
      flash[:success] = "New genre was added!"
      redirect_to genres_path
    else
      flash[:danger] = "There's something wrong!"
      render :new
    end
  end

  def edit
  end

  def update
    if @genre.update_attributes(genre_params)
      flash[:success] = "Genre updated"
      redirect_to genres_path
    else
      flash.now[:danger] = "Genre update failed"
      render :edit
    end
  end

  def destroy
    if @genre.destroy
      flash[:success] = "Genre deleted successful"
      redirect_to genres_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit :name
  end

  def load_genre
    @genre = Genre.find_by id: params[:id]
  end
end
