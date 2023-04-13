class BordFavorite < ApplicationRecord
  belongs_to :customer
  belongs_to :bordgame
  validates_uniqueness_of :bordgame_id, scope: :customer_id
end
