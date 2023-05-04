class Public::FavoritesController < ApplicationController
  
  def index
    if params[:customer_id]
     @customer = Customer.find(params[:customer_id])
     @favorites = @customer.favorites.includes(game: :genre).order(created_at: :desc).page(params[:favorites_page]).per(10)
    else
     @favorites = current_customer.favorites.includes(game: :genre).order(created_at: :desc).page(params[:favorites_page]).per(10)
    end
  end
  
  def create
    @game = Game.find(params[:game_id])
    @favorite = current_customer.favorites.new(game_id: @game.id)
    @favorite.save
  end

  def destroy
    @game = Game.find(params[:game_id])
    @favorite = current_customer.favorites.find_by(game_id: @game.id)
    @favorite.destroy
  end
  
  
end