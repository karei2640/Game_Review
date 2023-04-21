class BordgameComment < ApplicationRecord
  belongs_to :customer
  belongs_to :bordgame
end
