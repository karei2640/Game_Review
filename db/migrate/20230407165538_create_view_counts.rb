class CreateViewCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :view_counts do |t|
      t.integer :game_id
      t.integer :bordgame_id
      t.integer :customer_id
      t.integer :admin_id

      t.timestamps
    end
  end
end
