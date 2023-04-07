class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :view_counts, dependent: :destroy
         has_many :game_comments, dependent: :destroy
         has_many :bordgame_comments, dependent: :destroy
         has_many :games
         has_many :bordgames
         has_one_attached :profile_image
  with_options presence: true do
  validates :name
  validates:birthday
  validates :email
  validates :telephone
  validates :post_code
  validates :prefecture_code
  validates :address
  end
  
  def active_for_authentication?
    super && (withdrawal == false)
  end
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
end
