class Public::SearchsController < ApplicationController
  def index
    @keyword = params[:keyword]
    @games = Game.where("game_title LIKE ?", "%#{params[:keyword]}%").page(params[:page]).per(15)
    @popular_games = Game.joins(:view_counts).group(:id).order('count(view_counts.id) desc').page(params[:page]).per(15)
    @bordgames = Bordgame.where("game_title LIKE ?", "%#{params[:keyword]}%").page(params[:page]).per(15)
    @popular_bordgames = Bordgame.joins(:bord_view_counts).group(:id).order('count(bord_view_counts.id) desc').page(params[:page]).per(15)
    @customers = Customer.where("name LIKE ?", "%#{params[:keyword]}%").page(params[:page]).per(15)
  end
end