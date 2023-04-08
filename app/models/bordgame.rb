class Bordgame < ApplicationRecord
  belongs_to :customer
  has_one :game
  has_many :genre_games
  belongs_to :table
  belongs_to :category
  belongs_to :tableplat
  has_many :view_counts, dependent: :destroy
    has_many :bordgame_comments, dependent: :destroy
    has_one_attached :image
end