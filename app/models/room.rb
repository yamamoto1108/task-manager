class Room < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  def last_message
    last_message = messages.last.created_at
  end
end
