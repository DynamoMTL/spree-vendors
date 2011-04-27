Order.class_eval do 
  def create_shipment!
    shipping_method.reload
    if shipments.present? 
      shipments.each {|s| update_attributes(:shipping_method => shipping_method) }
    else
      if Spree::Config[:ship_by_vendor]
        line_items.group_by {|line| line.variant.product.vendor}.each do |vendor, lines|
          shipment = Shipment.create(:vendor => vendor, :order => self, :shipping_method => shipping_method, :address => self.ship_address)
          self.shipments << shipment
          inventory_units.select {|i| i.variant.product.vendor == vendor }.each {|unit| shipment.inventory_units << unit }
        end
      else
        self.shipments << Shipment.create(:order => self, :shipping_method => shipping_method, :address => self.ship_address)
      end
    end
  end 
end
