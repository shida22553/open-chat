module V1
  class ReactionsController < ApplicationController
    def index
      @reactions = Reaction.all
    end
  end
end
