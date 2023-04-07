class Game < ApplicationRecord
  belongs_to :customer
  belongs_to :admin
  has_one :bordgame
  has_many :genre_games
  belongs_to :genre
  belongs_to :category
  belongs_to :platform
  
  has_many :view_counts, dependent: :destroy
  has_many :game_comments, dependent: :destroy
  has_one_attached :image
  
  
end