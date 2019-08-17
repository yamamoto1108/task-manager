class Team < ApplicationRecord
  has_many :team_users, dependent: :destroy
  has_many :users, through: :team_users
  has_many :boards

  has_one_attached :image
  validates :name, presence: true, length: { maximum: 15 }
  #validate :image_presence

  # def image_presence
  #   if image.attached?
  #     if !image.content_type.in?(%('image/jpeg image/png'))
  #       errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
  #     end
  #   else
  #     errors.add(:image, 'ファイルを添付してください')
  #   end
  # end
end
