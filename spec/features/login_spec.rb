require 'spec_helper'

describe "User Login" do

  it "am able to login" do
    visit "/"
    click_link "Sign up or Log in"
    fill_in "email", with: "demo+franklin@jumpstartlab.com"
    fill_in "password", with: "password"
    click_button "Log In"

    expect(page).to have_a_logged_in_nav_bar

    # NEGATIVE CASE
    # expect(page).not_to have_a_logged_in_nav_bar
  end

end