class CreateQuestions < ActiveRecord::Migration[5.0]
	def change
		create_table :questions do |t|
			t.string :title
			t.text :description
			t.integer :user_id, foreign_key: true
			t.timestamps
		end

		add_foreign_key :questions, :users, on_delete: :cascade
	end
end
