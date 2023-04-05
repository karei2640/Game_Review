class Public::BordgamesController < ApplicationController
  def index
    @bordgames = Bordgame.all
  end

  def show
    @bordgame = Bordgame.find(params[:id])
  end

  def new
    @bordgame = Bordgame.new
  end

  def create
    @bordgame = Bordgame.new(bordgame_params)
    @bordgame.image.attach(params[:bordgame][:image])
    if @bordgame.save
      redirect_to bordgame_path(@bordgame), notice: 'ボードゲームが登録されました。'
    else
      render :new
    end
  end  

  def edit
    @bordgame = Bordame.find(params[:id])
  end
  
  def update
    @bordgame = Bordame.find(params[:id])
    if @bordgame.update(game_params)
      redirect_to @bordgame
    else
      render 'edit'
    end
  end
  
  def destroy
    @bordgame = Bordame.find(params[:id])
    @bordgame.destroy
    redirect_to games_path
  end
  
  

  private

  def bordgame_params
    params.require(:bordgame).permit(:game_title, :platform, :categorie, :genre, :points, :release_date, :price, :introduct_title, :introduct, :good_introduct, :bad_introduct, :overall_review, :image)
  end
  
  def get_image
    image.url
  end

end
