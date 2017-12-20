class CreateUsers < ActiveRecord::Migration
	def change
		create_table do |t|
			t.string :email
			t.stirng :password
		end 
	end
end
