class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :comments
  with_options presence: true do
  validates :name
  validates :email
  validates :telephone
  validates :post_code
  validates :prefecture_code
  validates :address
  end
end
