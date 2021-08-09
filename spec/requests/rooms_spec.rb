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

  describe 'POST /rooms' do
    it 'responds 200.' do
      post v1_rooms_path, headers: headers, params: { name: 'name' }.to_json
      assert_response_schema_confirm(200)
    end

    it 'responds 400 when the params are incorrect.' do
      post v1_rooms_path, headers: headers, params: { name: '' }.to_json
      assert_response_schema_confirm(400)
    end
  end
end
