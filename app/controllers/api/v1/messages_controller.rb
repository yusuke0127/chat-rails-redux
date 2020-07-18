class Api::V1::MessagesController < ApplicationController
  def index
    @channel = Channel.find_by name: params[:channel_id]
    @messages = @channel.messages
    render json: @messages
  end

  def create
  end
end
