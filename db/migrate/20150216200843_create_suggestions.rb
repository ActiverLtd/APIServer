class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :activity_id
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
