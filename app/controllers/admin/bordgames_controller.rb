class Admin::BordgamesController < ApplicationController
  def index
    @bordgames = Bordgame.all
    @latest_bordgames = Bordgame.order(created_at: :desc).page(params[:page]).per(10)
    @popular_bordgames = Bordgame.joins(:bord_view_counts).group(:id).order('count(bord_view_counts.id) desc').page(params[:page]).per(10)
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
