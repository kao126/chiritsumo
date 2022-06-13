class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :posts, through: :post_tags, dependent: :destroy

  validates :hashname, presence: true, length: { maximum: 99 }

end
