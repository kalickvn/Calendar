class AddSettingsTable < ActiveRecord::Migration
  def up
    create_table :settings do |t|
      t.string :code
      t.text :value
      t.timestamps
    end

  end

  def down
  end
end
