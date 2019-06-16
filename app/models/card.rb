class Card < ApplicationRecord
  belongs_to :list
  validates :name, presence: true

  enum finish: {doing: false, done!: true}
end
