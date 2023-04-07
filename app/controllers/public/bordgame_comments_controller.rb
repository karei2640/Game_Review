class Public::BordgameCommentsController < ApplicationController
    
  def create
    bordgame = Bordgame.find(params[:game_id])
    @comment = current_customer.bordgame_comments.new(bordgame_comment_params)
    @comment.bordgame_id = bordgame.id
    @comment.save
  end

  def destroy
    @comment = BordgameComment.find(params[:id])
    @comment.destroy
  end

  private
  def bordgame_comment_params
    params.require(:bordgame_comment).permit(:comment)
  end
end
