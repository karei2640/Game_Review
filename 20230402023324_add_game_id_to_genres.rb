class AddGameIdToGenres < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :genre_id, :integer
  end
end
