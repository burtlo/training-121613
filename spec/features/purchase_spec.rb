require "spec_helper"

describe "Purchasing" do

  let(:user) { fake_user }

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

    random_menu_item.add_to_cart

    click_link "View Your Order"

    click_button "Checkout"

    within("#new_address") do
      fill_in "First name", :with => user.first_name
      fill_in "Last name", :with => user.last_name
      fill_in "Street address", :with => user.street_address
      fill_in "City", :with => user.city
      fill_in "State", :with => user.state
      fill_in "Zipcode", :with => user.zip_code

      # This is finding the input field next to a label with the name 'Email'
      # fill_in "Email", :with => "franklin.webber@gmail.com"

      # This is using the name of the input field
      # fill_in "address[email]", :with => "franklin.webber@gmail.com"

      # This is finding the first item with id 'address_email'
      first("#address_email").set(user.email)

      click_button "Use This Billing Address"
    end

    click_button "Pay with Card"

    # TODO: Expectation that an Strip iframe stripe_checkout_app


    within_frame("stripe_checkout_app") do

      fill_in "Email", :with => user.email
      fill_in "Card number", :with => user.credit_card.number
      fill_in "MM / YY", :with => user.credit_card.expiration
      fill_in "CVC", :with => user.credit_card.verification

      click_button "Pay"

    end

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