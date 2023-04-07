class TableGameGenre < ApplicationRecord
  has_many :games
  has_many :categories
  has_many :platforms
end
