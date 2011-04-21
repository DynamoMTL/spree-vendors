require File.dirname(__FILE__) + '/../spec_helper'

describe Order do
  let(:order) do
    Factory.create(:order_with_shipping_method).tap do |order|
      3.times do
        vendor  = Factory.create(:vendor)
        product = Factory.create(:product, :vendor => vendor)
        variant = Factory.create(:variant, :product => product)

        order.line_items << Factory.create(:line_item, :variant => variant)
      end
    end
  end

  context "without ship_by_vendor disabled" do
    before do 
      Spree::Config.set 'ship_by_vendor' => nil 
      order.next until order.state == 'complete'
    end
    specify { order.shipments.should have(1).shipment }
  end

  context "with ship_by_vendor enabled" do
    before do
      Spree::Config.set 'ship_by_vendor' => true
      order.next until order.state == 'complete'
    end
    specify { order.shipments.should have(3).shipments }
    specify { order.shipments.all?(&:vendor).should be_true }
  end
end
