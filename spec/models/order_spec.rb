require File.dirname(__FILE__) + '/../spec_helper'

describe Order do
  let(:order) { Factory(:order_with_vendors) }

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
      order.complete!
    end
    specify { order.shipments.should have(2).shipments }
  end
end
