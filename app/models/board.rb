class Board < ApplicationRecord
  belongs_to :background
  has_many :lists, dependent: :destroy
  has_many :cards, through: :lists
  belongs_to :user
  belongs_to :team, optional: true
  validates :name, presence: true, length: { maximum: 20 }
end
