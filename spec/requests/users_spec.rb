require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/hash' do
    it 'responds 200.' do
      get v1_users_hash_path
      assert_response_schema_confirm(200)
    end
  end
end
