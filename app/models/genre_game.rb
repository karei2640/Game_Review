class GenreGame < ApplicationRecord
  belongs_to :genre
  belongs_to :game
end
