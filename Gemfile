source "https://rubygems.org"

if ENV.key?('PUPPET_VERSION')
  puppetversion = "= #{ENV['PUPPET_VERSION']}"
else
  puppetversion = ['~> 3.5.1']
end

gem 'json'
gem 'puppet'                 , puppetversion
gem 'puppet-lint'
gem 'puppetlabs_spec_helper'
gem 'rspec'                  , '~> 3.3.0'
gem 'rspec-puppet'           , '~> 2.2.0'
gem 'simplecov'
