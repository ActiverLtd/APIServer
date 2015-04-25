class CreateProfiles < ActiveRecord::Migration
	def change
		create_table :profiles do |t|
			t.string :name
			t.text :description
			t.string :picture
			t.date :born
			t.boolean :male
			t.datetime :registered, :default => Time.now
			t.integer :range, :default => 50
			t.float :rating_mean
			t.integer :rating_count, :default => 0
			t.integer :user_id

			t.timestamps
		end
	end
end
