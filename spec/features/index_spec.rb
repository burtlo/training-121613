require 'spec_helper'

describe "User Login" do

  # it "am able to login" do
  #   visit "/"
  #   click_link "Sign up or Log in"
  #   fill_in "email", with: "demo+franklin@jumpstartlab.com"
  #   fill_in "password", with: "password"
  #   click_button "Log In"

  #   expect(page).to LoggedInNavBar.new
  #   expect(page).to have_a_logged_in_nav_bar

  #   # NEGATIVE CASE
  #   # expect(page).not_to have_a_logged_in_nav_bar
  # end

  # before(:each) do
  #   Capybara.configure do |config|
  #     config.match = :first
  #   end
  # end

  # after(:each) do
  #   Capybara.configure do |config|
  #     config.match = :smart
  #   end
  # end

  it "able to purchase" do
    visit "/"
    click_link "Albuquerque"
    click_link "Ono Burrito10"

    # Maybe too brittle
    # within "#item_104" do
    #   click_button "Add to Cart"
    # end

    items = page.all("div.item")
    first_item = items.first
    first_item.click_button "Add to Cart"

    items = page.all("div.item")
    last_item = items.last
    last_item.click_button "Add to Cart"

    click_link "View Your Order"

    click_button "Checkout"

    binding.pry

    within("#new_address") do
      fill_in "First name", :with => "Franklin"
      fill_in "Last name", :with => "Webber"
      fill_in "Street address", :with => "220 Magnolia St"
      fill_in "City", :with => "Denver"
      fill_in "State", :with => "CO"
      fill_in "Zipcode", :with => "80220"
      fill_in "address[email]", :with => "franklin.webber@gmail.com"
      click_button "Use This Billing Address"
    end

    click_button "Pay with Card"
  end













#   it "able to purchase" do
#     visit "/"
#     click_link "Albuquerque"
#     click_link "Ono Burrito10"

#     within(".item") do
#       click_button "Add to Cart"
#     end

#     within(".item") do
#       click_button "Add to Cart"
#     end

#     click_link "View Your Order"
#     click_button "Checkout"

#     within("#new_address") do
#       fill_in "First name", with: "Frank"
#       fill_in "Last name", with: "Webber"
#       fill_in "Street address", with: "200 Magnolia Street"
#       fill_in "City", with: "Denver"
#       fill_in "State", with: "CO"
#       fill_in "Zipcode", with: "80220"
#       fill_in "Email", with: "franklin.webber@gmail.com"
#     end

#     click_button "Use This Billing Address"

#     # click_button "Pay With Card"
#     page.all("button")[0].click

#     # This does not work - because it's in an iframe
#     # fill_in "email", with: "franklin.webber@gmail.com"
#     # fill_in "Card number", with: "4242424242424242"
#     # fill_in "MM / YY", with: "1215"
#     # fill_in "CVC", with: "123"

#     within_frame "stripe_checkout_app" do
#       fill_in "email", with: "franklin.webber@gmail.com"
#       fill_in "Card number", with: "4242424242424242"
#       fill_in "MM / YY", with: "1215"
#       fill_in "CVC", with: "123"
#       click_button "Pay"
#     end

#     expect(page).to have_text("Successfully submitted your order!")

#   end

# end

# def have_a_properly_defined_nav_bar
#   ProperlyDefinedNavBar.new()
# end

# class ProperlyDefinedNavBar
#   def matches?(page)
#     page.has_text?("Logged in as") and
#       page.has_link?("Account Profile") and
#         page.has_link?("Log out")
#   end

#   def failure_message_for_should
#     "It is missing all those things you want Sorry!"
#   end

#   def failure_message_for_should_not
#     "It has all those things you don't want it to have! Sorry!"
#   end

end