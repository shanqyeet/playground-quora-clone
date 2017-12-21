class Question < ActiveRecord::Base[5.0]
	# This is Sinatra! Remember to create a migration!
  belongs_to :user
  has_many :answer
end
