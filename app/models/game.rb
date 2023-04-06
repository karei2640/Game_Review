class Game < ApplicationRecord
    has_many :comments
    has_one :bordgame
    has_many :genre_games
    has_many :genres, through: :genre_games
    has_many :genres
    has_many :categories
    has_many :platforms
    has_one_attached :image
end
