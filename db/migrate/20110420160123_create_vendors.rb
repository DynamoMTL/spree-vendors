class CreateVendors < ActiveRecord::Migration
  def self.up
    create_table :vendors do |t|
      t.string :name

      t.timestamps
    end

    add_column :products, :vendor_id, :integer
    add_column :shipments, :vendor_id, :integer
  end

  def self.down
    remove_column :products, :vendor_id
    remove_column :shipments, :vendor_id
    drop_table :vendors
  end
end
