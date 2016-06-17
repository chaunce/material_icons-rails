$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'version'

Gem::Specification.new do |spec|
  spec.name         = 'material_icons-rails'
  spec.version      = MaterialIcons::Rails::VERSION
  spec.date         = Date.today.to_s
  spec.summary      = 'Google Material Icons'
  spec.description  = 'Google Material Icons font assets and form helpers'
  spec.author       = 'chaunce'
  spec.email        = 'chaunce.slc@gmail.com'
  spec.homepage     = 'https://github.com/chaunce/material_icons-rails'
  spec.license      = 'MIT'
  spec.files        = Dir['LICENSE', 'README.md', '{app,lib}/**/*']
  spec.test_files   = Dir['spec/**/*']
  spec.add_dependency 'rails', '>= 3.2'
  spec.add_dependency 'railties'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'sqlite3'
end