Deface::Override.new(
            :name => "banners_tab",
            :virtual_path => "spree/layouts/admin",
            :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
            :text => "<%= tab :banners, :icon => 'icon-th-list' %>")
