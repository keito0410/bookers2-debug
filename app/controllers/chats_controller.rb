class ChatsController < ApplicationController
	before_action :authenticate_user!
  def create
    @chat = Chat.create
    @user_room1 = UserRoom.create(:chat_id => @chat.id, :user_id => current_user.id)
    @user_room2 = UserRoom.create(params.permit(:user_id, :chat_id).merge(:chat_id => @chat.id))
  end

  def show
    @chat = Chat.find(params[:id])
    if UserRoom.where(:user_id => current_user.id, :chat_id => @chat.id).present?
      @rooms = @chat.rooms
      @room = Room.new
      @user_rooms = @chat.user_rooms
    end
  end
end
