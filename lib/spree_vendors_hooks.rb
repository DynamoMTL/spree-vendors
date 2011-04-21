class SpreeVendorsHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_product_sub_tabs do
    %(<%= tab :vendors %>)
  end
  insert_after :admin_products_index_search, :partial => 'admin/products/vendor_search_field'
  insert_after :admin_product_form_right,    :partial => 'admin/products/vendor_field'

  insert_before :admin_shipments_index_headers, :partial => 'admin/shipments/vendor_shipments_index_headers'
  insert_before :admin_shipments_index_rows,    :partial => 'admin/shipments/vendor_shipments_index_rows'
  insert_before :admin_shipment_edit_header,    :partial => 'admin/shipments/vendor_shipment_edit_header'
end
