class Admin::GenresController < ApplicationController
    
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def new
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
     redirect_to admin_genres_path, notice: "ジャンルを追加しました。"
    else
     flash.now[:danger] = "予期せぬエラーが発生しました"
     @genres = Genre.all
     render :index
    end
  end
  
  private

  def genre_params
   params.require(:genre).permit(:name)
  end
  
end
