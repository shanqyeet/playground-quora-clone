require 'bcrypt'
class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  include BCrypt
  
  has_secure_password
  has_many :question
  has_many :answer
  validates :name, presence: true
  validates :email, presence: true, format: {with: /\D+[@]\D+\.\D+/}, uniqueness: true
  validates :password, presence: true, length: {minimum: 8}
end
