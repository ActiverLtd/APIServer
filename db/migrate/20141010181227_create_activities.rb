class CreateActivities < ActiveRecord::Migration
	def change
		create_table :activities do |t|
			t.datetime :from
			t.datetime :to
			t.integer :activity_type_id
			t.integer :organizer_id
			t.integer :participant_count
			t.float :required_level

			t.string :location_name
			t.float :lat
			t.float :lng

			t.timestamps
		end
	end
end
