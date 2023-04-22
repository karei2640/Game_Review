class Game < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :view_counts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :bordgame
  has_many :genre_games
  belongs_to :customer
  belongs_to :genre
  belongs_to :category
  belongs_to :platform
  has_one_attached :image
  attribute :rank, :integer
  validates :introduct_title, presence: true
  validates :introduct, presence: true
  validates :overall_review, presence: true
  attribute :rank, :integer
  attribute :score, :integer  # スコアを追加
  def view_counts_guest
    view_counts.where(customer_id: nil).count
  end
  
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  
end