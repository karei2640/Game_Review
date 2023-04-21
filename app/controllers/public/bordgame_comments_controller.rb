class Public::BordgameCommentsController < ApplicationController
    
  def create
    bordgame = Bordgame.find(params[:bordgame_id])
    bordgame_comment = current_customer.bordgame_comments.new(bordgame_comment_params)
    bordgame_comment.bordgame_id = bordgame.id
    bordgame_comment.save
    redirect_to bordgame_path(bordgame),notice: 'コメントに成功しました。'
  end

  def destroy
    bordgame_comment = BordgameComment.find(params[:id])
    bordgame = bordgame_comment.bordgame
    bordgame_comment.destroy
    redirect_to bordgame_path(bordgame),alert: 'コメントを削除しました'
  end

  private
  def bordgame_comment_params
    params.require(:bordgame_comment).permit(:bordgame_comment)
  end
end
