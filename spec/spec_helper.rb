require 'json'
require 'nokogiri'
require 'pry'

require 'capybara'
require 'capybara/rspec'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = 'http://192.241.192.185:3002'

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

def have_a_logged_in_nav_bar
  LoggedInNavBar.new
end

class LoggedInNavBar
  def matches?(page)
    has_logged_in_text = page.has_text?("Logged in as")
    has_account_profile_link = page.has_link?("Account Profile")
    has_log_out_link = page.has_link?("Log out")

    @error_message = ""

    unless has_logged_in_text
      @error_message += "'Missing Logged in as ...' text "
    end

    unless has_account_profile_link
      @error_message += "No 'Account Profile' link "
    end

    unless has_log_out_link
      @error_message += "No 'Log out' link "
    end

    has_logged_in_text and has_account_profile_link and has_log_out_link
  end

  def failure_message_for_should
    @error_message
  end

  def failure_message_for_should_not
    "Should Not"
  end

end
