class MessageReaction < ApplicationRecord
  belongs_to :message
  belongs_to :reaction
end
