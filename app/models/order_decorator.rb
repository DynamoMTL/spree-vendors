Order.class_eval do 
  def create_shipment!
    shipping_method.reload
    if shipments.present? 
      shipments.each {|s| update_attributes(:shipping_method => shipping_method) }
    else
      if Spree::Config[:ship_by_vendor]
        line_items.group_by {|line| line.variant.product.vendor}.each do |vendor, lines|
          self.shipments << Shipment.create(:vendor => vendor, :order => self, :shipping_method => shipping_method, :address => self.ship_address)
        end
      else
        self.shipments << Shipment.create(:order => self, :shipping_method => shipping_method, :address => self.ship_address)
      end
    end
  end 
end
