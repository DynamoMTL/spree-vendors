class SpreeVendorsHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_product_sub_tabs do
    %(<%= tab :vendors %>)
  end
  insert_after :admin_products_index_search, :partial => 'admin/products/vendor_search_field'
  insert_after :admin_product_form_right,    :partial => 'admin/products/vendor_field'
end
