class Api::V1::MessagesController < ApplicationController
  def index
    @channel = Channel.find_by name: params[:channel_id]
    @messages = @channel.messages
    render json: @messages.as_json(
      only: [:id, :content, :created_at, :user_id],
    )
  end

  def create
  end
end
