class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :active_relationsips, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationsips, source: :follower

  has_many :passive_relationsips, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationsips, source: :following

  def followed_by?(user)
    passive_relationsips.find_by(following_id: user.id).present?
  end

  validates :email, presence: true
  validates :account_name, presence: true, uniqueness: true, length: { maximum: 15 }
  #validates :profile_image, presence: true
  #validates :introduction, length: { maximum: 200 }

  attachment :profile_image

  enum is_deleted: { Available: true, Invalid: false }

  def active_for_authentication?
    super && (is_deleted == "Invalid")
  end

  def self.looks(searches, words)
    if searches == "perfect_match"
      @user = User.where("account_name LIKE ?", "#{words}")
    else
      @user = User.where("account_name LIKE ?", "%#{words}%")
    end
  end
end
