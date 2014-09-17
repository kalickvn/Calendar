class AddCategoryCalendar < ActiveRecord::Migration
  def up
  	create_table :categories do |t|
      t.string :name
      t.string :description
      t.boolean :is_show_menu,:default => false
      t.integer :order_no
      t.timestamps
    end

    create_table :calendars do |t|
      t.string :name
      t.string :size
      t.string :paper_type
      t.string :box_type
      t.integer :category_id
      t.boolean :is_deleted
      t.string	:description
      t.timestamps
    end

    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.integer :calendar_id
      t.string :note
      t.string :email
      t.integer :quantity
    end

  end

  def down
  	drop_table :categories
  	drop_table :calendars
  	drop_table :orders
  end
end
