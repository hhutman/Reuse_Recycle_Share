class Shareable < ApplicationRecord
  #belongs_to :building
  belongs_to :user
  has_one :good
  has_one :service

  has_many :transactions
end
