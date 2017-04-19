class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :generate_authentication_token

  def generate_authentication_token
    self.authentication_token = Devise.friendly_token
  end 
  has_many :reservations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
