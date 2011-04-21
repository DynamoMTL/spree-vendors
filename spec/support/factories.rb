Factory.define(:vendor) do |record|
  record.name { |n| "Vendor ##{n}" }
end

Factory.define(:order_with_shipping_method, :parent => :order) do |record|
  record.shipping_method Factory(:shipping_method)
end
