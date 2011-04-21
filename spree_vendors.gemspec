Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_vendors'
  s.version     = '1.0.0'
  s.summary     = 'Spree extension to manage product vendors'
  s.description = 'A Spree extension that adds the ability to assign vendors to products, and break out shipments by vendor'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Joshua Nussbaum'
  s.email             = 'joshnuss@gmail.com'
  s.homepage          = 'http://www.godynamo.com'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path  = 'lib'

  s.has_rdoc = true

  s.add_dependency('haml')
  s.add_dependency('spree_core', '>= 0.40.3')
end
