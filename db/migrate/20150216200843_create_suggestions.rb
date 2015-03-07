class CreateSuggestions < ActiveRecord::Migration
	def change
		create_table :suggestions do |t|
			t.integer :activity_id, null: false
			t.integer :user_id, null: false
			t.integer :status, null: false

			t.timestamps
		end
	end
end
