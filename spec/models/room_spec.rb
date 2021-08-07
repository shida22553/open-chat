require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validations' do
    it 'is valid without name' do
      room = FactoryBot.build(:room, name: nil)
      expect(room.valid?).to eq(false)
    end
  end
end
