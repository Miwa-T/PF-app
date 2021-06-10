class PostImage < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :image, presence: true
  validates :explain, presence: true, length: { maximum: 200 }

  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end