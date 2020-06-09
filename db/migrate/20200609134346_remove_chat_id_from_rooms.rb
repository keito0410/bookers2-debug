class RemoveChatIdFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_reference :rooms, :chat_id, foreign_key: true
  end
end
