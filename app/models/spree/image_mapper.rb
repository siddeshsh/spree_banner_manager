class Spree::ImageMapper < ActiveRecord::Base
  attr_accessible :alt, :banner_id, :link, :shape, :x1, :x2, :y1, :y2
  belongs_to:banner
end
