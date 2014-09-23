class AddIsCatalogIsOwnCalendar < ActiveRecord::Migration
  def up
    add_column :calendars,:is_catalog,:boolean,:default => true
    add_column :calendars,:is_owned,:boolean,:default => false
  end

  def down
  end
end
