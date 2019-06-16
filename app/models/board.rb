class Board < ApplicationRecord
  belongs_to :background
  has_many :lists, dependent: :destroy
  has_many :cards, through: :lists
  validates :name, presence: true
end
