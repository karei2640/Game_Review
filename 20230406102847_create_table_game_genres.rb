class CreateTableGameGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :table_game_genres do |t|
      t.string :name
      t.integer :table_game_genre_id

      t.timestamps
    end
  end
end
