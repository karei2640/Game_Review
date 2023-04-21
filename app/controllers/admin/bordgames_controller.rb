class Admin::BordgamesController < ApplicationController
  def index
    @bordgames = Bordgame.page(params[:page]).per(150)
    @latest_bordgames = Bordgame.order(created_at: :desc).page(params[:latest_bordgames]).per(150)
    @customer = current_customer
  end
  
  def popular_index
    @bordgames = Bordgame.page(params[:page]).per(150)
    @popular_bordgames_all = Bordgame.joins(:bord_view_counts).group(:id).order('count(bord_view_counts.id) desc').page(params[:popular_bordgames_all_page]).per(150)
    @popular_bordgames_monthly = Bordgame.joins(:bord_view_counts).where(bord_view_counts: { created_at: 1.month.ago..Time.current }).group(:id).order('count(bord_view_counts.id) desc').page(params[:popular_bordgames_monthly_page]).per(150)
    @popular_bordgames_weekly = Bordgame.joins(:bord_view_counts).where(bord_view_counts: { created_at: 1.week.ago..Time.current }).group(:id).order('count(bord_view_counts.id) desc').page(params[:popular_bordgames_weekly_page]).per(150)
    @popular_bordgames_daily = Bordgame.joins(:bord_view_counts).where(bord_view_counts: { created_at: 1.day.ago..Time.current }).group(:id).order('count(bord_view_counts.id) desc').page(params[:popular_bordgames_daily_page]).per(150)
    @customer = current_customer
  end
  
  def favorite_index
    @bordgames = Bordgame.page(params[:page]).per(150)
    @favorite_bordgames_all = Bordgame.joins(:bord_favorites).group(:id).order('count(bord_favorites.id) desc').page(params[:favorite_bordgames_all_page]).per(150)
    @favorite_bordgames_monthly = Bordgame.joins(:bord_favorites).where(bord_favorites: { created_at: 1.month.ago..Time.current }).group(:id).order('count(bord_favorites.id) desc').page(params[:favorite_bordgames_monthly_page]).per(150)
    @favorite_bordgames_weekly = Bordgame.joins(:bord_favorites).where(bord_favorites: { created_at: 1.week.ago..Time.current }).group(:id).order('count(bord_favorites.id) desc').page(params[:favorite_bordgames_weekly_page]).per(150)
    @favorite_bordgames_daily = Bordgame.joins(:bord_favorites).where(bord_favorites: { created_at: 1.day.ago..Time.current }).group(:id).order('count(bord_favorites.id) desc').page(params[:favorite_bordgames_daily_page]).per(150)
    @customer = current_customer
  end

  def show
    @bordgame = Bordgame.find(params[:id])
    if current_customer
      current_customer.bord_view_counts.create(bordgame_id: @bordgame.id)
    else
      BordViewCount.create(bordgame_id: @bordgame.id)
    end
    @comment = BordgameComment.new
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to admin_bordgames_path
  end
end
