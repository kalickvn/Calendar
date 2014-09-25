class RechangeColumnDescription < ActiveRecord::Migration
  def up
    change_column :calendars,:description,:text
  end

  def down
  end
end
