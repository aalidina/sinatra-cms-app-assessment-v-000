class User < ActiveRecord::Base
  include ActiveModel::Validations
  validates_presence_of :username
  validates_presence_of :email
  validates_presence_of :password
  has_many :currencies
  has_secure_password
end
