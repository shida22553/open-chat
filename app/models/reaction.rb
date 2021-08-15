class Reaction < ApplicationRecord
  has_many :message_reactions, dependent: :destroy
  has_many :messages, dependent: :nullify, through: :message_reactions
end
