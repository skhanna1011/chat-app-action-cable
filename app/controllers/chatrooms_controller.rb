class ChatroomsController < ApplicationController
  
  def index
    @chatroom = Chatroom.new
    @chatrooms = Chatroom.all
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatrooms_path
    end
  end
  def show
    @chatroom = Chatroom.find_by(slug: params[:slug])
    @message = Message.new
  end

  private

  def chatroom_params
    params[:chatroom].permit(:topic)
  end
end