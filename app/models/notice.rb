class Notice < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 1000 }
  
  enum genre: { maintenance: 0, news: 1 }
end
