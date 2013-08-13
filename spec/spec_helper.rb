require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'rspec/autorun'

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require(f) }

require 'force_encoding'

RSpec.configure do |config|
  config.mock_with :rspec
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end