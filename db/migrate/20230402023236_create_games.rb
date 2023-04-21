class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :image
      t.string :genre_id
      t.string :platform_id
      t.string :category_id
      t.string :game_title, null: false
      t.text :introduct_title, null: false
      t.text :introduct, null: false
      t.text :good_introduct
      t.text :bad_introduct
      t.text :game_comment
      t.text :overall_review, null: false
      t.integer :points, null: false
      t.date :release_date
      t.string :genre
      t.string :platform
      t.string :category
      t.integer :price
      t.integer :customer_id

      t.timestamps
    end
  end
end
