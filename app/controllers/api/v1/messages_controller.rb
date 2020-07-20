class Api::V1::MessagesController < ApplicationController
  def index
    @channel = Channel.find_by name: params[:channel_id]
    @messages = @channel.messages
    render json: @messages.as_json(
      only: [:id, :content, :created_at, :user],
      include: { user: { only: [:email] } }
    )
  end

  def create
    @channel = Channel.find_by name: params[:channel_id]
    @message = @channel.messages.build(content: params[:content])
    @message.user = current_user
    @message.save
    render json: @message
  end

  private

  def message_params
    params.require(:message).permit(:content, :user)
  end
end
