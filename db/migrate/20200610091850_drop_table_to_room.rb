class DropTableToRoom < ActiveRecord::Migration[5.2]
  def change
  	drop_table :rooms
  end
end
