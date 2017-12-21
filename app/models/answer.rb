class Answer < ActiveRecord::Base[5.0]
	# This is Sinatra! Remember to create a migration!
  belongs_to :user
  belogns_to :question
end
