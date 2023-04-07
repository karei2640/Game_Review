class Public::BordgamesController < ApplicationController
  def index
    @bordgames = Bordgame.all
  end

  def show
    @bordgame = Bordgame.find(params[:id])
    @bordgame_comment = BordgameComment.new
  end

  def new
    @bordgame = Bordgame.new
  end

  def create
    @bordgame = Bordgame.new(bordgame_params)
    @bordgame.customer_id = current_customer.id
    if @bordgame.save
      redirect_to @bordgame
    else
      render 'new'
    end
  end  

  def edit
    @bordgame = Bordgame.find(params[:id])
  end
  
  def update
    @bordgame = Bordgame.find(params[:id])
    if @bordgame.update(game_params)
      redirect_to @bordgame
    else
      render 'edit'
    end
  end
  
  def destroy
    @bordgame = Bordgame.find(params[:id])
    @bordgame.destroy
    redirect_to bordgames_path
  end
  
  

  private

  def bordgame_params
    params.require(:bordgame).permit(:game_title,:tableplat_id, :category_id, :table_id, :points, :release_date, :price, :image, :introduct_title, :introduct, :good_introduct, :bad_introduct, :overall_review)
  end
  
  def ensure_correct_customer
    @bordgame = Bordgame.find(params[:id])
    unless @bordgame.customer == current_customer.id
      redirect_to bordgames_path
    end
  end
  
end
