class CreateTableplats < ActiveRecord::Migration[6.1]
  def change
    create_table :tableplats do |t|
      t.string :name
      t.integer :tableplat_id

      t.timestamps
    end
    Tableplat.create(name: "テーブル")
    Tableplat.create(name: "その他")
  end
end
