class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :boards
  has_many :card_users, dependent: :destroy
  has_many :cards, through: :card_users
  has_many :team_users, dependent: :destroy
  has_many :teams, through: :team_users
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :comments

  validates :name, presence: true
  validate :image_presence

  has_one_attached :image

  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image, 'ファイルを添付してください')
    end
  end
end
