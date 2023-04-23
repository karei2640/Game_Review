class SearchsController < ApplicationController
  def index
    @keyword = params[:keyword]
    @games = Game.where("game_title LIKE ?", "%#{params[:keyword]}%").order(view_count: :desc).page(params[:page]).per(15)
    @bordgames = Bordgame.where("game_title LIKE ?", "%#{params[:keyword]}%").order(bord_view_count: :desc).page(params[:page]).per(15)
    @customers = Customer.where("name LIKE ?", "%#{params[:keyword]}%").page(params[:page]).per(15)
  end
end