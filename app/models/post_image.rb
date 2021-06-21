class PostImage < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  validates :image, presence: true
  validates :explain, presence: true, length: { maximum: 200 }
  validates :title, presence: true
  validates :caption, presence: true

  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def my_favorite(user)
    favorites.where(user_id: user.id).first
  end

  after_create do
    post_image = PostImage.find_by(id: self.id)
    tags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    post_image.tags = []
    tags.uniq.map do |tag|
      hashtag = Tag.find_or_create_by(tag_name: tag.downcase.delete('#'))
      post_image.tags << hashtag
    end
  end

  before_update do
    post_image = PostImage.find_by(id: self.id)
    post_image.tags.clear
    tags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |tag|
      hashtag = Tag.find_or_create_by(tag_name: tag.downcase.delete('#'))
      post_image.tags << hashtag
    end
  end

end