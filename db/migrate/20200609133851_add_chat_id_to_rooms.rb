class AddChatIdToRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :chat_id, foreign_key: true
  end
end
