class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :game
  belongs_to :bordgame
end
