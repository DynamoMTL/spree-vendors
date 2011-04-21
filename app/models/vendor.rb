class Vendor < ActiveRecord::Base
  has_many :products
  has_many :shipments

  validates :name, :presence => true, :uniqueness => true

  default_scope order(:name)
end
