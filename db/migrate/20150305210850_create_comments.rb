class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.string :text
			t.integer :writer
			t.integer :activity_id

			t.timestamps null: false
		end
	end
end
