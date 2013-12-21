require 'json'
require 'nokogiri'
require 'pry'
require 'faker'
require 'capybara'
require 'capybara/rspec'
require 'capybara/poltergeist'

# Commented out because it overrides Capybara features
# that the example tests depend on.
# require 'helpers/capybara_ext/all'
require 'helpers/core_ext/all'
require 'helpers/shared_examples/all'
require 'helpers/matchers/all'
require 'helpers/page_objects/all'
require 'helpers/models/all'
require 'helpers/fixtures/all'

Capybara.run_server = false

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# Capybara.default_driver = :selenium
Capybara.default_driver = :poltergeist

Capybara.app_host = 'http://192.241.192.185:3002'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
end
