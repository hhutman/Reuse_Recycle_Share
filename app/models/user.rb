class User < ApplicationRecord
  belongs_to :building

  has_many :transactions
  has_many :shareables
end
