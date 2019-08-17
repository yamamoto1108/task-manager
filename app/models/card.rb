class Card < ApplicationRecord
  belongs_to :list
  has_many :card_users, dependent: :destroy
  has_many :users, through: :card_users
  has_many :comments, dependent: :destroy
  has_many_attached :images
  validates :name, presence: true, length: { maximum: 20 }

  enum finish: {doing: false, done!: true}

  include RankedModel 
  ranks :row_order , with_same: :list_id 
end
