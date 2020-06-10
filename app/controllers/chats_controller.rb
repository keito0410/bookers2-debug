class ChatsController < ApplicationController
	before_action :authenticate_user!
  
  def show
    @room = Room.find(params[:id])
    #present?の戻り値は真偽値。よって、trueの場合、
    if User_room.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @user_room = @room.user_room
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @room = Room.new
  end
end
