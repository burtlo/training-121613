require 'json'
require 'nokogiri'

require 'capybara'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.default_driver = :poltergeist
Capybara.app_host = 'http://192.241.192.185:3001'
# Capybara.app_host = 'http://192.241.192.185:3002'
# Capybara.app_host = 'http://192.241.192.185:3003'
# Capybara.app_host = 'http://192.241.192.185:3004'




RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
end



def load_json_file(filename)
  file_contents = File.read(filename)
  data = JSON.parse(file_contents)
  return data
end

def load_xml_file(filename)
  file_contents = File.read("database.xml")
  Nokogiri::XML(file_contents)
end

shared_examples "a correct configuration" do
  it "has the correct information" do
    expect(env_config).to(eq(expected_env_config))
  end
end
