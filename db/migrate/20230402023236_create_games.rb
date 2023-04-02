class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :genre_id, null: false
      t.string :game_name, null: false
      t.text :introduct, null: false
      t.integer :customer_id

      t.timestamps
    end
  end
end
