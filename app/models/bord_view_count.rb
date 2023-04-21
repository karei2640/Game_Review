class BordViewCount < ApplicationRecord
    belongs_to :customer, optional: true
    belongs_to :bordgame
    
    scope :guest, -> { where(customer_id: nil) }
end
