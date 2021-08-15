class Message < ApplicationRecord
  belongs_to :room
  has_many :message_reactions, dependent: :destroy
  has_many :reactions, dependent: :destroy, through: :message_reactions
  validates :room_id, presence: true
  validates :user_id, presence: true
  validates :user_name, presence: true
  validates :content, presence: true
  validates :content_type, presence: true

  enum content_types: {
    text: 0,
    sticker: 1
  }, _prefix: true
end
