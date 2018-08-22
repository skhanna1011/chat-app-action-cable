class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    
    if @message.save
      ActionCable.server.broadcast 'messages',
        message: @message.body,
        user: @message.user.name
      head :ok
    end
  end

  private

  def message_params
    params[:message].permit(:body, :chatroom_id)
  end
end