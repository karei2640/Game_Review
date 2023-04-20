class ViewCount < ApplicationRecord
  belongs_to :game
  belongs_to :customer, optional: true

  scope :guest, -> { where(customer_id: nil) }
end
