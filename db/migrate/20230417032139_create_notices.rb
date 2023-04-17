class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.string :title
      t.text :content
      t.string :category

      t.timestamps
    end
  end
end
