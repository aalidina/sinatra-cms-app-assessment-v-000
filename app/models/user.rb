class User < ActiveRecord::Base
  include ActiveModel::Validations
  validates :username, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  has_many :currencies
  has_secure_password
end
