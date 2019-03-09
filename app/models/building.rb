class Building < ApplicationRecord
  has_many :users
  has_many :shareables
  has_many :transactions
end
