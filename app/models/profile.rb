class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :license
  has_one_attached :bill
  has_one_attached :pic
end

