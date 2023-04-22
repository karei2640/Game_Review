class BordgameComment < ApplicationRecord
  belongs_to :customer
  belongs_to :bordgame
  belongs_to :parent_bord_comment, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: :parent_bord_comment_id, dependent: :destroy
end
