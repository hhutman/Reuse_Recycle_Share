class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  belongs_to :building, optional: true
  has_many :goods, dependent: :destroy
  has_many :services, dependent: :destroy


  def self.update_or_create(attributes)
  assign_or_new(attributes).save
end

def self.assign_or_new(attributes)
  obj = first || new
  obj.assign_attributes(attributes)
  obj
end

def after_sign_in_remember_me(resource)
   remember_me resource
 end



end
