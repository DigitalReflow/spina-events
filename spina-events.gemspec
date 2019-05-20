$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spina/events/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spina-events"
  s.version     = Spina::Events::VERSION
  s.authors     = ["Dan Mitchell"]
  s.email       = ["dan@digitalreflow.co.uk"]
  s.homepage    = "https://github.com/danmitchell-"
  s.summary     = "Events Engine for Spina CMS"
  s.description = "Events Engine for Spina CMS comprising conferences with speakers, partners and agenda"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_runtime_dependency 'spina', '>= 0.11.1', '< 2.0'
  s.add_runtime_dependency 'friendly_id', '~> 5.2', '>= 5.2.1'
  s.add_runtime_dependency 'kaminari'
  s.add_runtime_dependency 'geocoder'

  s.add_development_dependency 'pg'
  s.add_development_dependency 'simplecov', '~> 0'
  s.add_development_dependency 'rspec-rails', '~> 3.6.0', '>= 3.6.0'
  s.add_development_dependency 'factory_bot_rails', '~> 4.0'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1'
  s.add_development_dependency 'pry-rails', '~> 0'
  s.add_development_dependency 'rails-controller-testing', '~> 1.0.2', '>= 1.0.2'
  s.add_development_dependency 'capybara', '>= 2.14.3', '~> 3.20.2'
end
