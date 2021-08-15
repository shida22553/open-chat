require 'rails_helper'

RSpec.describe 'Reactions', type: :request do
  let(:headers) do
    {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  end
  describe 'GET /reactions' do
    before do
      FactoryBot.create_list(:reaction, 10)
    end
    it 'responds 200.' do
      get v1_reactions_path, headers: headers
      assert_response_schema_confirm(200)
    end
  end
end
