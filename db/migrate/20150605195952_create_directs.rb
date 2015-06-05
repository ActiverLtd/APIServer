class CreateDirects < ActiveRecord::Migration
	def change
		create_table :directs do |t|
			t.integer :user_id
			t.integer :direct_id

			t.timestamps null: false
		end

		add_index :directs, [:user_id, :direct_id], :unique => true
	end
end
