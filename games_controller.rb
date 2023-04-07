class Admin::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page]).per(5)
    @bordgames = Bordgame.page(params[:page]).per(5)
  end
  
  def show
    @game = Game.find(params[:id])
    unless ViewCount.find_by(customer_id: current_customer.id, game_id: @game.id)
      current_customer.view_counts.create(game_id: @game.id)
    end
    @game_comment = GameComment.new
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
    redirect_to games_path
  end
  
  private
  
  def game_params
    params.require(:game).permit(:game_title, :platform_id,:tableplat_id, :category_id, :table_id, :genre_id, :points, :release_date, :price, :image, :introduct_title, :introduct, :good_introduct, :bad_introduct, :overall_review)
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



