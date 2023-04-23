class AddViewCountsCountToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :view_counts_count, :integer
  end
end
