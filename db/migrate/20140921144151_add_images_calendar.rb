class AddImagesCalendar < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.integer :calendar_id
      t.string :image

      t.timestamps
    end
    add_index :photos, :calendar_id
  end

  def down
  end
end
