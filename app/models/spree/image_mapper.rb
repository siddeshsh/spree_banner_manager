class Spree::ImageMapper < ActiveRecord::Base
  attr_accessible :alt, :banner_id, :link, :shape, :x1, :x2, :y1, :y2, :target
  belongs_to :banner
end
