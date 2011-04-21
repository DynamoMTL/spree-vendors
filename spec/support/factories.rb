Factory.define(:vendor) do |record|
  record.name { |n| "Vendor ##{n}" }
end

Factory.define(:product_with_vendor, :parent => :product) do |record|
  record.vendor Factory(:vendor)
end

Factory.define(:variant_with_vendor, :parent => :variant) do |record|
  record.product Factory(:product_with_vendor)
end

Factory.define(:order_with_vendors, :parent => :order) do |record|
  record.shipping_method Factory(:shipping_method)
  record.after_create { |order| Factory(:line_item, :order => order, :variant => Factory(:variant_with_vendor)) }
end
