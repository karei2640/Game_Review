class Admin::BordgamesController < ApplicationController
  def index
    @bordgames = Bordgame.all
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to admin_games_path
  end
end
