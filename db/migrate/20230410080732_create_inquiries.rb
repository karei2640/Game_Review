class CreateInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiries do |t|
      t.string :status
      t.string "name", null: false
      t.string "email", null: false
      t.text "message", null: false
      t.string "reply_email"
      t.string "reply_phone"

      t.timestamps
    end
  end
end
