module Spree
  class Banner < ActiveRecord::Base
    attr_accessible :name, :url, :image_name, :sale_event_id, :banner_type, :position, :live
    
    belongs_to :active_sale_event, :class_name => "Spree::ActiveSaleEvent", :foreign_key => "sale_event_id"

    validates :position, :image_name, :banner_type, :presence => true
    has_many:image_mappers
    
    scope :live_banners, lambda {|tag, type | where("live = :live and name = :name and banner_type = :banner_type", {:live => true, :name => tag, :banner_type => type }) } 
    TYPES = %w(Head Side)
    
    def image_url
      "http://slider.styletagassets.com/banners/#{self.image_name}"
    end
    
    def sale_path
      self.url.blank? ? self.active_sale_event.permalink : self.url 
    end
    
  end
end
