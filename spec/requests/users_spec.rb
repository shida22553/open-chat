require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/hash' do
    it 'responds 200.' do
      get users_hash_path
      expect(response).to have_http_status(200)
    end
  end
end
