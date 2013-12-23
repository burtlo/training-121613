def have_a_logged_in_nav_bar
  LoggedInNavBar.new
end

class LoggedInNavBar
  def matches?(page)
    has_logged_in_text = page.has_text?(logged_in_text)
    has_account_profile_link = page.has_link?(account_profile_link_text)
    has_log_out_link = page.has_link?(log_out_link_text)

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
    # TODO: Write a better failure message
  end

  private

  def logged_in_text
    t("navbar.logged_in")
  end

  def account_profile_link_text
    t("navbar.account_profile_link")
  end

  def log_out_link_text
    t("navbar.log_out_link")
  end

end