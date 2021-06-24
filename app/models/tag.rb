class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy
  has_many :post_images, through: :tag_maps

  validates :tag_name, presence: true, length: { maximum: 99 }
end
