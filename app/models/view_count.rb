class ViewCount < ApplicationRecord
    belongs_to :customer
    belongs_to :admin
    belongs_to :game
    belongs_to :bordgame
end
