class AnswerVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  belongs_to :answers
  belongs_to :users
  has_many :answer_votes
end
