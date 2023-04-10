class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_one_attached :profile_image
         has_many :bord_view_counts, dependent: :destroy
         has_many :view_counts, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :bordgame_comments, dependent: :destroy
         has_many :games
         has_many :bordgames
         has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
         has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
         has_many :followings, through: :relationships, source: :followed
         has_many :followers, through: :reverse_of_relationships, source: :follower
         has_many :favorites
         has_many :bord_favorites
        
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
  
  # フォローしたときの処理
  def follow(customer_id)
    relationships.create(followed_id: customer_id)
  end
  # フォローを外すときの処理
  def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
  end
  # フォローしているか判定
  def following?(customer)
    followings.include?(customer)
  end
  
end
