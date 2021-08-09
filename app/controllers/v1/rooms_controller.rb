module V1
  class RoomsController < ApplicationController
    LIMIT = 100
    def index
      @rooms = Room.last(LIMIT)
    end

    def create
      @room = Room.new(room_params)
      @room.save!
    rescue ActiveRecord::RecordInvalid
      render json: { code: :bad_request, message: @room.errors.full_messages }, status: :bad_request
    end

    private

    def room_params
      params.permit(:name)
    end
  end
end
