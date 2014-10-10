class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.datetime :from
      t.datetime :to
      t.integer :activity_type_id
      t.integer :organizer_id
      t.text :message

      t.timestamps
    end
  end
end
