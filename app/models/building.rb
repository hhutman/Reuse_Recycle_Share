class Building < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :shareables
  has_many :transactions
end
