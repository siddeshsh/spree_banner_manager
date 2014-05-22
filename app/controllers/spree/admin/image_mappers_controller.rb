class Spree::Admin::ImageMappersController < ApplicationController
    def create
        @image_mapper=Spree::ImageMapper.new(x1: params[:x1],y1: params[:y1],x2: params[:x2],y2: params[:y2],link: params[:link],alt: params[:alt],shape: params[:shape])
        @banner = Spree::Banner.find(params[:id])
        @image_mapper.banner_id=@banner.id
        @image_mapper.save
        @pins=@banner.image_mappers
         respond_to do |format|
            format.js
     end
    end
end
