InventoryUnit.class_eval do

  def self.create_units(order, variant, sold, back_order)
    if back_order > 0 && !Spree::Config[:allow_backorders]
      raise "Cannot request back orders when backordering is disabled"
    end 

    shipment = order.shipments.detect do |shipment| 
      if Spree::Config[:ship_by_vendor]
        !shipment.shipped? && shipment.vendor == variant.product.vendor
      else
        !shipment.shipped? 
      end
    end

    sold.times { order.inventory_units.create(:variant => variant, :state => "sold", :shipment => shipment) }
    back_order.times { order.inventory_units.create(:variant => variant, :state => "backordered", :shipment => shipment) }
  end 

end
