require "spec_helper"

describe "Purchasing" do

  it "able to purchase" do
    visit "/"
    click_link "Albuquerque"
    click_link "Ono Burrito10"

    #
    # Finding this id may change, so this is brittle:
    #  * What if the product would be removed
    #  * What if the product was de-prioritized
    #
    # within "#item_104" do
    #   click_button "Add to Cart"
    # end

    items = all("div.item")
    first_item = items.first
    first_item.click_button "Add to Cart"

    items = all("div.item")
    last_item = items.last
    last_item.click_button "Add to Cart"

    click_link "View Your Order"

    click_button "Checkout"

    within("#new_address") do
      fill_in "First name", :with => "Franklin"
      fill_in "Last name", :with => "Webber"
      fill_in "Street address", :with => "220 Magnolia St"
      fill_in "City", :with => "Denver"
      fill_in "State", :with => "CO"
      fill_in "Zipcode", :with => "80220"
      # fill_in "address[email]", :with => "franklin.webber@gmail.com"
      # fill_in "Email", :with => "franklin.webber@gmail.com"
      first("#address_email").set("franklin.webber@gmail.com")

      click_button "Use This Billing Address"
    end

    click_button "Pay with Card"
    sleep 30



  end

  #
  # Setting Capybara to match on the first item
  # can and will cause all matching to use this
  # behavior.
  #
  # Would we rather possibly the wrong fields be
  # filled in or have an ambigious error?
  #

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

end