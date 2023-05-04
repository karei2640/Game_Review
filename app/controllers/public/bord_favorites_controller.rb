class Public::BordFavoritesController < ApplicationController
    
  def index
     if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @bordfavorite = @customer.bord_favorites.includes(game: :genre).order(created_at: :desc).page(params[:favorites_page]).per(10)
     else
      @bordfavorite = current_customer.favorites.includes(game: :genre).order(created_at: :desc).page(params[:favorites_page]).per(10)
     end
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