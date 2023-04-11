class Admin::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page]).per(5)
    @latest_games = Game.order(created_at: :desc).page(params[:page]).per(10)
    @popular_games = Game.joins(:view_counts).group(:id).order('count(view_counts.id) desc').page(params[:page]).per(10)
  end
  
  def show
    @game = Game.find(params[:id])
      if current_customer
       current_customer.view_counts.create(game_id: @game.id)
      else
        ViewCount.create(game_id: @game.id)
      end  
    @comment = Comment.new
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to admin_games_path
  end
end
