Gem::Specification.new do |s|
  s.name        = 'linguists_field_guide'
  s.summary     = 'Linguist\'s Field Guide'
  s.description = 'Field guide for programming languages, based on the knowledge imparted by github-linguist'
  s.homepage    = 'https://github.com/ticky/linguists-field-guide'
  s.version     = '0.2.0'
  s.date        = '2021-01-05'
  s.authors     = ['Jessica Stokes']
  s.email       = 'hello@jessicastokes.net'
  s.license     = 'MIT'
  s.files       = ['lib/linguists_field_guide.rb', 'LICENSE.md', 'README.md']

  s.add_development_dependency "rake", ">= 12.3.3"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "simplecov", "~> 0.21.2"
  s.add_development_dependency "github-linguist", "~> 7.13.0"
end
