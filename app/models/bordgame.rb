class Bordgame < ApplicationRecord
    has_many :comments
    belongs_to :game
    has_many :genre_games
    has_many :genres, through: :genre_games
    has_one_attached :image
end