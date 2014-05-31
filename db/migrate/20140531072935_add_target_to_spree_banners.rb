class AddTargetToSpreeBanners < ActiveRecord::Migration
  def change
    add_column :spree_banners, :target, :boolean , :default => 0
  end
end
