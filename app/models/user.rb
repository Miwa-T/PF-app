class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :email, presence: true
  validates :name, presence: true, uniqueness: true
  validates :account_name, presence: true, uniqueness: true
  validates :profile_image, presence: true
  validates :introduction, presence: true, length: { maximum: 200 }
  validates :number, presence: true, numericality: true

  attachment :profile_image

  enum is_deleted: {Available: true, Invalid: false}

  def active_for_authentication?
    super && (self.is_deleted == "Invalid")
  end

end
