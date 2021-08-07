class UsersController < ApplicationController
  def create_hash
    render json: { hash: SecureRandom.hex(10) }
  end
end
