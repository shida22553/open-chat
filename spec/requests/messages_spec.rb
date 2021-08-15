require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  let(:headers) do
    {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  end
  let(:room) { FactoryBot.create(:room) }
  describe 'GET /:room_id/messages' do
    before do
      FactoryBot.create_list(:message, 10, room: room)
    end
    it 'responds 200.' do
      get v1_room_messages_path(room_id: room.id), headers: headers
      assert_response_schema_confirm(200)
    end
  end

  describe 'POST /:room_id/messages' do
    let(:params) do
      {
        user_id: '12345abcde',
        user_name: 'Name',
        content: 'Content',
        content_type: 0
      }
    end
    it 'responds 200.' do
      post v1_room_messages_path(room_id: room.id), headers: headers, params: params.to_json
      assert_response_schema_confirm(200)
    end

    it 'responds 400 when the params are incorrect.' do
      params['content'] = ''
      post v1_room_messages_path(room_id: room.id), headers: headers, params: params.to_json
      assert_response_schema_confirm(400)
    end
  end

  describe 'PUT /:room_id/messages/:message_id/reactions' do
    let(:message) { FactoryBot.create(:message) }
    let(:reaction) { FactoryBot.create(:reaction) }
    let(:params) do
      {
        user_id: '12345abcde',
        user_name: 'Name',
        reaction_id: reaction.id
      }
    end
    it 'responds 200.' do
      put v1_room_message_reactions_path(room_id: room.id, message_id: message.id),
          headers: headers, params: params.to_json
      assert_response_schema_confirm(200)
    end
  end
end
