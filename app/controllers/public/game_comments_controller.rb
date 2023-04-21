class Public::GameCommentsController < ApplicationController
  
  def index
    @games = Game.page(params[:page]).per(1)
  end  
  def create
    game = Game.find(params[:game_id])
    comment = current_customer.comments.new(comment_params)
    comment.game_id = game.id
    comment.save
    redirect_to game_path(game),notice: 'コメントに成功しました。'
  end

  def destroy
    comment = Comment.find(params[:id])
    game = comment.game
    comment.destroy
    redirect_to game_path(game),alert: 'コメントを削除しました'
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
