class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
    Category.create(name: "シングル")
    Category.create(name: "マルチ")
    Category.create(name: "2人用")
    Category.create(name: "3人用")
    Category.create(name: "4人用")
    Category.create(name: "その他")
  end
end
