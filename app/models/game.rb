class Game < ApplicationRecord
  
  has_many :view_counts, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :customer
  has_one :bordgame
  has_many :genre_games
  belongs_to :genre
  belongs_to :category
  belongs_to :platform
  has_one_attached :image
  
  
end