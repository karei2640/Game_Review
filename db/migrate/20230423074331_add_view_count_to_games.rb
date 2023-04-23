class AddViewCountToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :view_count, :integer, default: 0
  end
end
