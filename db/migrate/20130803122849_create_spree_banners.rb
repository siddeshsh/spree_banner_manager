class CreateSpreeBanners < ActiveRecord::Migration
  def change
    create_table :spree_banners do |t|
      t.string :name
      t.string :url
      t.string :image_name
      t.integer :sale_event_id
      t.boolean :live
      t.integer :position
      t.string :banner_type
      t.timestamps
    end
  end
end