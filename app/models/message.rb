class Message < ApplicationRecord
  belongs_to :room
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
