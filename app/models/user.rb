class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :boards
  has_many :card_users
  has_many :cards, through: :card_users
  has_many :team_users
  has_many :teams, through: :team_users
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :comments

  validates :name, presence: true

  has_one_attached :image
end
