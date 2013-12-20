require 'json'
require 'nokogiri'
require 'pry'
require 'faker'

require 'capybara'
require 'capybara/rspec'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = 'http://192.241.192.185:3002'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
end

require 'helpers/shared_examples/all'
require 'helpers/matchers/all'
require 'helpers/core_ext/all'
require 'helpers/page_objects/all'
require 'helpers/models/all'
require 'helpers/data/all'