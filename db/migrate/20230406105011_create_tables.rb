class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :table_id

      t.timestamps
    end
    Table.create(name: "ボード")
    Table.create(name: "カード")
    Table.create(name: "タイル")
    Table.create(name: "ダイス")
    Table.create(name: "パズル")
    Table.create(name: "立体")
    Table.create(name: "その他")
  end
end
