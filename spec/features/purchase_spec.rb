require "spec_helper"

describe "Purchasing" do

  it "able to purchase" do
    visit "/"
    # TODO: Change to click any random city
    click_link "Albuquerque"
    # TODO: Change to click any random store
    click_link "Ono Burrito10"

    #
    # Finding this id may change, so this is brittle:
    #  * What if the product would be removed
    #  * What if the product was de-prioritized
    #
    # within "#item_104" do
    #   click_button "Add to Cart"
    # end

    # TODO: Helper for add a random item to my cart
    items = all("div.item")
    first_item = items.first
    first_item.click_button "Add to Cart"

    items = all("div.item")
    last_item = items.last
    last_item.click_button "Add to Cart"

    click_link "View Your Order"

    click_button "Checkout"

    # TODO: Can we use random data ?
    within("#new_address") do
      fill_in "First name", :with => "Franklin"
      fill_in "Last name", :with => "Webber"
      fill_in "Street address", :with => "220 Magnolia St"
      fill_in "City", :with => "Denver"
      fill_in "State", :with => "CO"
      fill_in "Zipcode", :with => "80220"

      # This is finding the input field next to a label with the name 'Email'
      # fill_in "Email", :with => "franklin.webber@gmail.com"

      # This is using the name of the input field
      # fill_in "address[email]", :with => "franklin.webber@gmail.com"

      # This is finding the first item with id 'address_email'
      first("#address_email").set("franklin.webber@gmail.com")

      click_button "Use This Billing Address"
    end

    click_button "Pay with Card"

    # TODO: Expectation that an Strip iframe stripe_checkout_app

    within_frame("stripe_checkout_app") do

      # TODO: credit card - test billing data
      fill_in "Email", :with => "franklin.webber@gmail.com"
      fill_in "Card number", :with => "4242424242424242"
      fill_in "MM / YY", :with => "12/15"
      fill_in "CVC", :with => "123"

      click_button "Pay"

    end

    success_image = first("#order_success")
    expect(success_image).to(be,"The order successful image does appear on the page")
    # TODO: the purchases, the final cost of order
    expect(page).to have_text("Successfully submitted your order!")

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

end