class RenameRoomIdColumnToRooms < ActiveRecord::Migration[5.2]
  def change
  	rename_column :rooms, :room_id, :chat_id
  end
end
