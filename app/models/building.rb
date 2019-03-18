class Building < ApplicationRecord
  has_many :users
  has_many :user_buildings
  has_many :users, through: :user_buildings
end
