class User < ActiveRecord::Base[5.0]
	# This is Sinatra! Remember to create a migration!
  validates :email, presence: true,format: {with: /\D+[@]\D+\.\D+/}, uniqueness: true,
  validates :password, presence: true, length: {equal_or_greater_than: 8}
end
