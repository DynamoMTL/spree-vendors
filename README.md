Spree Vendors Extension
=========

A Vendor management tool for Spree, containing the following features:

- Manage a list of vendors
- Assign products to a vendor
- Search products by vendor
- Can automatically break shipments based on vendor, if you configure `Spree::Config.set :ship_by_vendor => true`

Installation
============

1) add the gem to your `Gemfile`:

`gem 'spree_vendors'`

or

`gem 'spree_vendors', :git => 'git://github.com/DynamoMTL/spree-vendors.git'`


2) run bundler:

`bundle install`

3) install it and migrate:

`rake spree_vendors:install db:migrate`

Editing Vendors
===========

1. Login to Administraton Console
2. Click on Products
3. Click on Vendors

Assigning Vendor to Product
===========
1. Go to product edit screen
2. Choose vendor from dropdown

