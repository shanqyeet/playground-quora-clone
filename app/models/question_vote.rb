class QuestionVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  belongs_to :questions
  belongs_to :users
  has_many :question_votes
end
