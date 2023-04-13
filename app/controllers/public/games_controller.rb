class Public::GamesController < ApplicationController
  
  def index
    @games = Game.page(params[:page]).per(5)
    @latest_games = Game.order(created_at: :desc).page(params[:page]).per(20)
    @popular_games = Game.joins(:view_counts).group(:id).order('count(view_counts.id) desc').page(params[:page]).per(20)
    @favorite_games = Game.joins(:favorites).group(:id).order('count(favorites.id) desc').page(params[:page]).per(20)
    @customer = current_customer
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
  
  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new(game_params)
    @game.customer_id = current_customer.id
    if @game.save
      redirect_to game_path(@game)
    else
      render 'new'
    end
  end
  
  def edit
    @game = Game.find(params[:id])
  end
  
  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render 'edit'
    end
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    if admin_signed_in?
    redirect_to admin_games_path # 管理者ページにリダイレクト
    else
    redirect_to games_path # 一般顧客はゲーム一覧ページにリダイレクト
    end
  end
  
  
  private
  
  def game_params
    params.require(:game).permit(:game_title, :platform_id,:tableplat_id, :category_id, :table_id, :genre_id, :points, :release_date, :price, :image, :introduct_title, :introduct, :good_introduct, :bad_introduct, :overall_review,:game_comment)
  end
  
  def game_comment_params
    params.require(:game_comment).permit(:comment)
  end


  def ensure_correct_customer
    @game = Game.find(params[:id])
    unless @game.customer == current_customer.id
      redirect_to games_path
    end
  end
end 


