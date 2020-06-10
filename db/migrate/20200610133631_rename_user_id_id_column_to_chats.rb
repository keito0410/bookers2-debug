class RenameUserIdIdColumnToChats < ActiveRecord::Migration[5.2]
  def change
  	rename_column :chats, :user_id_id, :user_id
  end
end
