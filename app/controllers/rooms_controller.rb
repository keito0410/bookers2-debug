class RoomsController < ApplicationController
	before_action :authenticate_user!, :only => [:create]

  def create
    if UserRoom.where(:user_id => current_user.id, :chat_id => params[:room][:chat_id]).present?
      @room = Room.create(params.require(:room).permit(:user_id, :content, :chat_id).merge(:user_id => current_user.id))
      redirect_to "/chats/#{@room.chat_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
