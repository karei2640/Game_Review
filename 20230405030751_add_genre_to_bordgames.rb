class AddGenreToBordgames < ActiveRecord::Migration[6.1]
  def change
    add_column :bordgames, :genre, :string
  end
end
