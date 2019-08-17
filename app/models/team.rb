class Team < ApplicationRecord
  has_many :team_users, dependent: :destroy
  has_many :users, through: :team_users
  has_many :boards

  has_one_attached :image
  validates :name, presence: true, length: { maximum: 15 }

end
