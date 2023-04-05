class Type < ActiveRecord::Migration[6.1]
  def change
    create_table :type do |t|
      t.string :name
      t.timestamps
    end
  end
end
