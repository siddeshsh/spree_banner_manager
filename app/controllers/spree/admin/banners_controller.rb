module Spree
  module Admin
    class BannersController < ResourceController

      #before_filter :is_cs
      before_filter :load_menus, :only => [:new, :edit, :create, :update]

      # GET /banners
      # GET /banners.xml
      def index
        @banners = Banner.all#.reverse.sort_by { |banner| banner.position }.paginate(:page => params[:page], :per_page => 30)

        respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @banners }
        end
      end

      # GET /banners/1
      # GET /banners/1.xml
      def show
        @banner = Banner.find(params[:id])

        respond_to do |format|
          format.html # show.html.erb
          format.xml  { render :xml => @banner }
        end
      end

      # GET /banners/new
      # GET /banners/new.xml
      def new
        @banner = Banner.new
        @types = Banner::TYPES

        respond_to do |format|
          format.html # new.html.erb
          format.xml  { render :xml => @banner }
        end
      end

      # GET /banners/1/edit
      def edit
        @banner = Banner.find(params[:id])
        @types = Banner::TYPES
      end

      # POST /banners
      # POST /banners.xml
      def create
        params["banner"]["sale_event_id"] = nil if params["banner"]["sale_event_id"] == ""
        @banner = Banner.new(params[:banner])
        @types = Banner::TYPES

        respond_to do |format|
          if @banner.save
            format.html { redirect_to(admin_banners_path, :notice => 'Banner was successfully created.') }
            format.xml  { render :xml => @banner, :status => :created, :location => @banner }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @banner.errors, :status => :unprocessable_entity }
          end
        end
      end

      # PUT /banners/1
      # PUT /banners/1.xml
      def update
        params["banner"]["sale_event_id"] = nil if params["banner"]["sale_event_id"] == ""
        @banner = Banner.find(params[:id])
        @types = Banner::TYPES

        respond_to do |format|
          if @banner.update_attributes(params[:banner])
            format.html { redirect_to(admin_banners_path, :notice => 'Banner was successfully updated.') }
            format.xml  { head :ok }
          else
            format.html { render :action => "edit" }
            format.xml  { render :xml => @banner.errors, :status => :unprocessable_entity }
          end
        end
      end

      # DELETE /banners/1
      # DELETE /banners/1.xml
      def destroy
        @banner = Banner.find(params[:id])
        @banner.destroy

        respond_to do |format|
          format.html { redirect_to(admin_banners_url) }
          format.xml  { head :ok }
        end
      end

      def load_menus
        @active_sale_ids = Spree::ActiveSaleEvent.live_active.sort_by { |as| as.eventable.name.upcase }
        @all_sales_menu = (Spree::ActiveSaleEvent.live_active.roots.map{|ss| ss.name} << ["marketing", "lookbook"]).flatten
      end
    end
  end
end
