class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :game
  validates_uniqueness_of :game_id, scope: :customer_id
end
