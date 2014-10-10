class CreateActivityShows < ActiveRecord::Migration
  def change
    create_table :activity_shows, :id => false do |t|
      t.integer :user_id
      t.integer :activity_id
      t.boolean :accepted, default: false

      t.timestamps
    end
    add_index :activity_shows, :user_id
  end
end
