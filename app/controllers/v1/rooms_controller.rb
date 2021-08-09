module V1
  class RoomsController < ApplicationController
    PER = 30
    def index
      page = params[:page] || 1
      @rooms = Room.all.page(page).per(PER)
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
