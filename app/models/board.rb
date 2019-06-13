class Board < ApplicationRecord
  belongs_to :background
  validates :name, presence: true
end
