class SearchsController < ApplicationController
  def index
    @keyword = params[:keyword]
    @genre_id = params[:genre_id]
    if @genre_id.present? && @keyword.present?
    @games = Game.where(genre_id: @genre_id).where("game_title LIKE ?", "%#{@keyword}%").order(view_count: :desc).page(params[:page]).per(15)
    elsif @genre_id.present?
      @games = Game.where(genre_id: @genre_id).order(view_count: :desc).page(params[:page]).per(15)
    elsif @keyword.present?
      @games = Game.where("game_title LIKE ?", "%#{@keyword}%").order(view_count: :desc).page(params[:page]).per(15)
    else
      @games = Game.none
    end
      
    @table_id = params[:table_id]
    if @table_id.present? && @keyword.present?
    @bordgames = Bordgame.where(table_id: @table_id).where("game_title LIKE ?", "%#{@keyword}%").order(bord_view_count: :desc).page(params[:page]).per(15)
    elsif @table_id.present?
      @bordgames = Bordgame.where(table_id: @table_id).order(bord_view_count: :desc).page(params[:page]).per(15)
    elsif @keyword.present?
      @bordgames = Bordgame.where("game_title LIKE ?", "%#{@keyword}%").order(bord_view_count: :desc).page(params[:page]).per(15)
    else
      @bordgames = Bordgame.none
    end
    @customers = Customer.where("name LIKE ?", "%#{@keyword}%").page(params[:page]).per(15)
  end
end