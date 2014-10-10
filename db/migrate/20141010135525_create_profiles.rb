class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.date :born
      t.datetime :registered
      t.integer :range
      t.float :rating_mean
      t.integer :rating_count
      t.integer :user_id

      t.timestamps
    end
  end
end
