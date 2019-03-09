class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :building
  belongs_to :shareable
end
