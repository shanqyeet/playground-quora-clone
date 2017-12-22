class CreateQuestionVotes < ActiveRecord::Migration[5.0]
	def change
		create_table :question_votes do |t|
			t.integer :vote_counts
			t.integer :question_id
			t.integer :user_id
			t.timestamps
		end

	add_foreign_key :question_votes, :users, on_delete: :cascade
	add_foreign_key :question_votes, :questions, on_delete: :cascade
	end
end
