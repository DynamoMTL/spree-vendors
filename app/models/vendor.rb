class Vendor < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  default_scope order(:name)
end
