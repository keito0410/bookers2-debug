class Chat < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
end
