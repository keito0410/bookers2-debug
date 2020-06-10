class CreateUserModels < ActiveRecord::Migration[5.2]
  def change
    create_table :user_models do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
