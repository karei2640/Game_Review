class Inquiry < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :message, presence: true
end
