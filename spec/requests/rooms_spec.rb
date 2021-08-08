require 'rails_helper'

RSpec.describe 'Rooms', type: :request do
  let(:headers) do
    {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  end
  describe 'GET /rooms' do
    before do
      FactoryBot.create_list(:room, 10)
    end
    it 'responds 200.' do
      get v1_rooms_path, headers: headers
      assert_response_schema_confirm(200)
    end
  end
end
