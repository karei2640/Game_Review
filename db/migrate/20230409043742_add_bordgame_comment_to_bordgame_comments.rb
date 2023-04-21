class AddBordgameCommentToBordgameComments < ActiveRecord::Migration[6.1]
  def change
    add_column :bordgame_comments, :bordgame_comment, :text
  end
end
