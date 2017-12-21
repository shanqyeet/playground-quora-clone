class CreateAnswers < ActiveRecord::Migration[5.0]
	def change
		create_table :answers do |t|
			t.text :answer
			t.integer :user_id, foreign_key: true
			t.integer :question_id, foreign_key: true
			t.timestamps
		end

		add_foreign_key :answers, :users, on_delete: :cascade
		add_foreign_key :answers, :questions, on_delete: :cascade
	end
end
