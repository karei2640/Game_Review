class CreateBordFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :bord_favorites do |t|
      t.integer :customer_id
      t.integer :bordgame_id

      t.timestamps
    end
  end
end
