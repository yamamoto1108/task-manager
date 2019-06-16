class Board < ApplicationRecord
  belongs_to :background
  has_many :lists, dependent: :destroy
  validates :name, presence: true
end
