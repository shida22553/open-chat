module V1
  class RoomsController < ApplicationController
    PER = 30
    def index
      page = params[:page] || 1
      @rooms = Room.all.page(page).per(PER)
    end
  end
end
