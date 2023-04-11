class Public::BordgamesController < ApplicationController
  def index
    @bordgames = Bordgame.all
    @latest_bordgames = Bordgame.order(created_at: :desc).page(params[:page]).per(10)
    @popular_bordgames = Bordgame.joins(:bord_view_counts).group(:id).order('count(bord_view_counts.id) desc').page(params[:page]).per(10)
    @bordfavorite_bordgames = Bordgame.joins(:bord_favorites).group(:id).order('count(bord_favorites.id) desc').page(params[:page]).per(20)
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
      render 'new'
    end
  end  

  def edit
    @bordgame = Bordgame.find(params[:id])
  end
  
  def update
    @bordgame = Bordgame.find(params[:id])
    if @bordgame.update(bordgame_params)
      redirect_to @bordgame
    else
      render 'edit'
    end
  end
  
  def destroy
    @bordgame = Bordgame.find(params[:id])
    @bordgame.destroy
   if admin_signed_in?
      redirect_to admin_bordgames_path # 管理者ページにリダイレクト
   else
      redirect_to boardgames_path # 一般顧客はボードゲーム一覧ページにリダイレクト
   end
  end
  
 
  private

  def bordgame_params
    params.require(:bordgame).permit(:game_title,:tableplat_id, :category_id, :table_id, :points, :release_date, :price, :image, :introduct_title, :introduct, :good_introduct, :bad_introduct, :overall_review,:bordgame_comment)
  end
  
  def ensure_correct_customer
    @bordgame = Bordgame.find(params[:id])
    unless @bordgame.customer == current_customer.id
      redirect_to bordgames_path
    end
  end
  
end
