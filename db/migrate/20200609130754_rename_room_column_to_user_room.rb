class RenameRoomColumnToUserRoom < ActiveRecord::Migration[5.2]
  def change
  	rename_column :user_rooms, :room_id, :chat_id
  end
end
