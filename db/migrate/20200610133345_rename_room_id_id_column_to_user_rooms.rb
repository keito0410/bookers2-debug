class RenameRoomIdIdColumnToUserRooms < ActiveRecord::Migration[5.2]
  def change
  	rename_column :user_rooms, :room_id_id, :room_id
  end
end
