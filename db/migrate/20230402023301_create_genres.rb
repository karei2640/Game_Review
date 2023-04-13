class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name
      t.integer :genre_id

      t.timestamps
    end
    Genre.create(name: "RPG")
    Genre.create(name: "アクション")
    Genre.create(name: "シューティング")
    Genre.create(name: "シミュレーション")
    Genre.create(name: "アドベンチャー")
    Genre.create(name: "スポーツ")
    Genre.create(name: "パズル")
    Genre.create(name: "カード")
    Genre.create(name: "レーシング")
    Genre.create(name: "ミュージック")
    Genre.create(name: "その他")
  end
end
