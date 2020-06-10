class RenameUserIdIdColumnToUserRooms < ActiveRecord::Migration[5.2]
  def change
  	rename_column :user_rooms, :user_id_id, :user_id
  end
end
