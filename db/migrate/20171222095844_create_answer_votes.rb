class CreateAnswerVotes < ActiveRecord::Migration[5.0]
	def change
		create_table :answer_votes do |t|
			t.integer :vote_counts
			t.integer :answer_id
			t.integer :user_id
		end

		add_foreign_key :answer_votes, :users, on_delete: :cascade
		add_foreign_key :answer_votes, :answers, on_delete: :cascade
	end
end 
