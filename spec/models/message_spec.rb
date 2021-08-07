require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    it 'is valid without room_id' do
      message = FactoryBot.build(:message, room: nil)
      expect(message.valid?).to eq(false)
    end
    it 'is valid without user_id' do
      message = FactoryBot.build(:message, user_id: nil)
      expect(message.valid?).to eq(false)
    end
    it 'is valid without user_name' do
      message = FactoryBot.build(:message, user_name: nil)
      expect(message.valid?).to eq(false)
    end
    it 'is valid without content' do
      message = FactoryBot.build(:message, content: nil)
      expect(message.valid?).to eq(false)
    end
    it 'is valid without type' do
      message = FactoryBot.build(:message, type: nil)
      expect(message.valid?).to eq(false)
    end
  end
end
