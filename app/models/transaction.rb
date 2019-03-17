class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :good
  belongs_to :service
end
