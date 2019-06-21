class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :boards
  has_many :card_users
  has_many :cards, through: :card_users

  validates :name, presence: true

  has_one_attached :image
end
