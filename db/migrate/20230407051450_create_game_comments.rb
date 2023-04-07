class CreateGameComments < ActiveRecord::Migration[6.1]
  def change
    create_table :game_comments do |t|
      t.text :comment
      t.integer :customer_id
      t.integer :game_id

      t.timestamps
    end
  end
end
