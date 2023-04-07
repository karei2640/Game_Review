class Public::GameCommentsController < ApplicationController
    
  def create
    game = Game.find(params[:game_id])
    @comment = current_customer.game_comments.new(game_comment_params)
    @comment.game_id = game.id
    @comment.save
  end

  def destroy
    @comment = GameComment.find(params[:id])
    @comment.destroy
  end

  private
  def game_comment_params
    params.require(:game_comment).permit(:comment)
  end
end
