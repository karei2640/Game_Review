class CreateBordViewCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bord_view_counts do |t|
      t.integer :bordgame_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
