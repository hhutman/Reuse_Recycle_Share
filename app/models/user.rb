class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  belongs_to :building, optional: true
  has_many :shareable
  has_many :goods, dependent: :destroy

  def profile
    super || create_profile

  end

end
