class Public::BordFavoritesController < ApplicationController
    
  def index
    @customer = current_customer
    @bordfavorite = current_customer.bord_favorites.includes(game: :genre).order(created_at: :desc).page(params[:favorites_page]).per(10)

  end  
    
  def create
    @bordgame = Bordgame.find(params[:bordgame_id])
    @bordfavorite = current_customer.bord_favorites.new(bordgame_id: @bordgame.id)
    @bordfavorite.save
  end

  def destroy
    @bordgame = Bordgame.find(params[:bordgame_id])
    @bordfavorite = current_customer.bord_favorites.find_by(bordgame_id: @bordgame.id)
    @bordfavorite.destroy
  end
end