class Board < ApplicationRecord
  belongs_to :background
  has_many :lists, dependent: :destroy
  has_many :cards, through: :lists
  belongs_to :user
  validates :name, presence: true
end
