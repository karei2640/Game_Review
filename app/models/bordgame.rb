class Bordgame < ApplicationRecord
  has_many :bord_favorites, dependent: :destroy
  has_many :bord_view_counts, dependent: :destroy
  has_many :bordgame_comments, dependent: :destroy
  belongs_to :customer
  has_one :game
  has_many :genre_games
  belongs_to :table
  belongs_to :category
  belongs_to :tableplat
    has_one_attached :image
    
  def bord_favorited_by?(customer)
    bord_favorites.where(customer_id: customer.id).exists?
  end
end