class Public::BordgamesController < ApplicationController
  def index
    @bordgames = Bordgame.page(params[:page]).per(150)
    @latest_bordgames = Bordgame.order(created_at: :desc).page(params[:latest_bordgames]).per(150)
    @popular_bordgames_all = Bordgame.joins(:bord_view_counts).group(:id).order('count(bord_view_counts.id) desc').page(params[:popular_bordgames_all_page]).per(150)
    @popular_bordgames_monthly = Bordgame.joins(:bord_view_counts).where(bord_view_counts: { created_at: 1.month.ago..Time.current }).group(:id).order('count(bord_view_counts.id) desc').page(params[:popular_bordgames_monthly_page]).per(150)
    @popular_bordgames_weekly = Bordgame.joins(:bord_view_counts).where(bord_view_counts: { created_at: 1.week.ago..Time.current }).group(:id).order('count(bord_view_counts.id) desc').page(params[:popular_bordgames_weekly_page]).per(150)
    @popular_bordgames_daily = Bordgame.joins(:bord_view_counts).where(bord_view_counts: { created_at: 1.day.ago..Time.current }).group(:id).order('count(bord_view_counts.id) desc').page(params[:popular_bordgames_daily_page]).per(150)
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

  def new
    @bordgame = Bordgame.new
  end

  def create
    @bordgame = Bordgame.new(bordgame_params)
    @bordgame.customer_id = current_customer.id
    if @bordgame.save
      redirect_to @bordgame
    else
      flash.now[:alert] = "投稿に失敗しました。必要な項目を全て入力してください。"
      render 'new'
    end
  end  

  def edit
    @bordgame = Bordgame.find(params[:id])
  end
  
  def update
    @bordgame = Bordgame.find(params[:id])
    if @bordgame.update(bordgame_params)
      redirect_to bordgame_path(@bordgame),notice: '投稿を更新しました。'
    else
      flash.now[:alert] = "投稿に失敗しました。必要な項目を全て入力してください。"
      render 'edit'
    end
  end
  
  def destroy
    @bordgame = Bordgame.find(params[:id])
    @bordgame.destroy
   if admin_signed_in?
      redirect_to admin_bordgames_path, alert: '投稿を削除しました。' # 管理者ページにリダイレクト
   else
      redirect_to bordgames_path, alert: '投稿を削除しました。' # 一般顧客はボードゲーム一覧ページにリダイレクト
   end
  end
  
 
  private

  def bordgame_params
    params.require(:bordgame).permit(:game_title,:tableplat_id, :category_id, :table_id, :points, :release_date, :price, :image, :introduct_title, :introduct, :good_introduct, :bad_introduct, :overall_review,:bordgame_comment)
  end
  
  def bordgame_comment_params
    params.require(:bordgame_comment).permit(:comment)
  end
  
  def ensure_correct_customer
    @bordgame = Bordgame.find(params[:id])
    unless @bordgame.customer == current_customer.id
      redirect_to bordgames_path
    end
  end
  
end
