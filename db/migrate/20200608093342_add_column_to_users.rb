class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :longitude, :float
  end
end
