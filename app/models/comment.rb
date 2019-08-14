class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :card

  validates :text, presence: true, length: { maximum: 30 }
end
