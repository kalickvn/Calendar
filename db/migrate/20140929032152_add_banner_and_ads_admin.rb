class AddBannerAndAdsAdmin < ActiveRecord::Migration
  def up
    create_table :advertisings do |t|
      t.string :link
      t.integer :order_no
      t.boolean :is_deleted
      t.attachment :image

      t.timestamps
    end

    create_table :banners do |t|
      t.attachment :image
      t.timestamps
    end

  end

  def down
  end
end
