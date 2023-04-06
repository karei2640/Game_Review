class BoardGame < ActiveRecord::Migration[6.1]
  def change
    create_table :bordgames do |t|
      t.string :image
      t.string :genre_id
      t.string :platform_id
      t.string :categorie_id
      t.string :game_title, null: false
      t.text :introduct_title, null: false
      t.text :introduct, null: false
      t.text :good_introduct
      t.text :bad_introduct
      t.text :overall_review, null: false
      t.integer :points, null: false
      t.date :release_date
      t.string :genre
      t.string :platform
      t.string :categorie
      t.integer :price
      t.integer :customer_id

      t.timestamps
    end
  end
end
