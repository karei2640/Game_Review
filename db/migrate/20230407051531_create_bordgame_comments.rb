class CreateBordgameComments < ActiveRecord::Migration[6.1]
  def change
    create_table :bordgame_comments do |t|
      t.text :comment
      t.integer :customer_id
      t.integer :bordgame_id

      t.timestamps
    end
  end
end
