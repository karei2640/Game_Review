class Public::FavoritesController < ApplicationController
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