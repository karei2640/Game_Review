class Admin::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page]).per(5)
    @latest_games = Game.order(created_at: :desc).page(params[:page]).per(150)
    @popular_games_all = Game.joins(:view_counts).group(:id).order('count(view_counts.id) desc').page(params[:popular_games_all_page]).per(150)
    @popular_games_monthly = Game.joins(:view_counts).where(view_counts: { created_at: 1.month.ago..Time.current }).group(:id).order('count(view_counts.id) desc').page(params[:popular_games_monthly_page]).per(150)
    @popular_games_weekly = Game.joins(:view_counts).where(view_counts: { created_at: 1.week.ago..Time.current }).group(:id).order('count(view_counts.id) desc').page(params[:popular_games_weekly_page]).per(150)
    @popular_games_daily = Game.joins(:view_counts).where(view_counts: { created_at: 1.day.ago..Time.current }).group(:id).order('count(view_counts.id) desc').page(params[:popular_games_daily_page]).per(150)
    @favorite_games = Game.joins(:favorites).group(:id).order('count(favorites.id) desc').page(params[:favorite_games_page]).per(150)
    @favorite_games_all = Game.joins(:favorites).group(:id).order('count(favorites.id) desc').page(params[:favorite_games_all_page]).per(150)
    @favorite_games_monthly = Game.joins(:favorites).where(favorites: { created_at: 1.month.ago..Time.current }).group(:id).order('count(favorites.id) desc').page(params[:favorite_games_monthly_page]).per(150)
    @favorite_games_weekly = Game.joins(:favorites).where(favorites: { created_at: 1.week.ago..Time.current }).group(:id).order('count(favorites.id) desc').page(params[:favorite_games_weekly_page]).per(150)
    @favorite_games_daily = Game.joins(:favorites).where(favorites: { created_at: 1.day.ago..Time.current }).group(:id).order('count(favorites.id) desc').page(params[:favorite_games_daily_page]).per(150)
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
