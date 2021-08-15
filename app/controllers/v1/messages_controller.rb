module V1
  class MessagesController < ApplicationController
    LIMIT = 10
    # rubocop:disable Metrics/AbcSize
    def index
      @messages = Message.includes(:message_reactions).where(room_id: params[:room_id]).order(id: :desc)
      @messages = @messages.where('id > ?', params[:prev_message_id]) if params[:prev_message_id].present?
      @messages = @messages.where('id < ?', params[:next_message_id]) if params[:next_message_id].present?
      @messages = @messages.limit(LIMIT)
    end
    # rubocop:enable Metrics/AbcSize

    def create
      room = Room.find(params[:room_id])
      @message = room.messages.new(message_params)
      @message.save!
    rescue ActiveRecord::RecordInvalid
      render json: { code: :bad_request, message: @message.errors.full_messages }, status: :bad_request
    end

    def send_reaction
      message = Message.find(params[:message_id])
      message_reaction = message.message_reactions.find_or_initialize_by(reaction_id: params[:reaction_id])
      message_reaction.save!
      @reaction = message_reaction.reaction
    end

    private

    def message_params
      params.permit(:user_id, :user_name, :content, :content_type)
    end
  end
end
