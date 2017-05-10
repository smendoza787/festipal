class User < ActiveRecord::Base
  validates :email, presence: true
  validates :username, presence: true
  validates :password, presence: true

  has_secure_password

  has_many :user_festivals
  has_many :festivals, through: :user_festivals
end
