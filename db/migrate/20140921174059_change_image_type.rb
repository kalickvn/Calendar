class ChangeImageType < ActiveRecord::Migration
  def up
    remove_column :photos, :image
    add_attachment :photos, :image
  end

  def down
  end
end
