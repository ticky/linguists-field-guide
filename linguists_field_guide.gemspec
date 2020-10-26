Gem::Specification.new do |s|
  s.name        = 'linguists_field_guide'
  s.summary     = 'Linguist\'s Field Guide'
  s.description = 'Field guide for programming languages, based on the knowledge imparted by github-linguist'
  s.homepage    = 'https://github.com/ticky/linguists-field-guide'
  s.version     = '0.1.0'
  s.date        = '2020-10-26'
  s.authors     = ['Jessica Stokes']
  s.email       = 'hello@jessicastokes.net'
  s.license     = 'MIT'
  s.files       = ['lib/linguists_field_guide.rb', 'LICENSE.md', 'README.md']

  s.add_development_dependency "bundler", "~> 2.1.4"
  s.add_development_dependency "rake", ">= 12.3.3"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "github-linguist", "~> 7.11.1"
  s.add_development_dependency "rubocop-ast", ">= 1.0.0"
  s.add_development_dependency "unparser", "~> 0.5.3"
end
