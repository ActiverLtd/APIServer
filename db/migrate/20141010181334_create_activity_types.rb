class CreateActivityTypes < ActiveRecord::Migration
  def change
    create_table :activity_types do |t|
      t.string :name
      t.text :style
      t.string :image_url

      t.timestamps
    end
  end
end
