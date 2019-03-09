class Shareable < ApplicationRecord
  belongs_to :building
  belongs_to :user

  has_many :transactions
end
