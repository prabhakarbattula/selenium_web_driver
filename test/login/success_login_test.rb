require 'test_helper'

class SeleniumTestUnit03122014 < Test::Unit::TestCase
  include CommonMethods

  def test_verify_elements_on_login_screen
    @driver.get("http://caregeneral.net/login/")
    assert element_present?(:css, "a.logo.navbar-brand")

    assert_equal "ACCOUNT LOGIN", @driver.find_element(:css, "h1.page-title").text

    assert_input_element_with_id_empty("user_email")
    assert_input_element_with_id_empty("user_password")
    assert_input_empty(id: "user_password")
    assert_equal "LOGIN", @driver.find_element(:css, "button.common-btn").text
    assert_equal "", @driver.find_element(:id, "badge-app-store").text


    assert_link_with_text_present("Didn't receive unlock instructions?")
    assert_link_with_text_present("Conact Us")
    assert_link_with_text_present("Text me the link")
    assert_link_with_text_present("Privacy Policy")
    assert_link_with_text_present("Terms of Service")
  end

  def assert_input_element_with_id_empty(id)
    assert_equal "", @driver.find_element(:id, id).text
  end

  def test_login_success
    login_to_site("prabhakar+superadmin@bigbinary.com", "welcome")
    assert_equal "prabhakar+superadmin", @driver.find_element(:css, "span.user_name").text
  end

  def test_login_failure
    login_to_site("prabhakar", "welcome")
    assert_equal "prabhakar+superadmin", @driver.find_element(:css, "span.user_name").text
  end

  def test_login_screen_after_success
    login_to_site("prabhakar+superadmin", "welcome")
    # assigning the element object to a local variable menu_dropdown
    menu_dropdown = @driver.find_element(:css, ".icon-sort-down")
    # using the above element variable moving the mouse to that particular element
    @driver.mouse.move_to menu_dropdown

    assert_equal "My Info", @driver.find_element(:link, "My Info").text

    assert_equal "Translations", @driver.find_element(:css, "a[title=\"Translations\"]").text

    assert_equal "Super Admin", @driver.find_element(:link, "Super Admin").text

    assert_equal "Admin", @driver.find_element(:link, "Admin").text

    assert_equal "Help", @driver.find_element(:link, "Help").text

    assert_equal "Support", @driver.find_element(:css, "a.intercom").text

    assert_equal "Getting Started", @driver.find_element(:link, "Getting Started").text

    assert_equal "Get Mobile App", @driver.find_element(:link, "Get Mobile App").text

    assert_equal "Contact Us", @driver.find_element(:link, "Contact Us").text

    assert_equal "Feedback and Suggestions", @driver.find_element(:link, "Feedback and Suggestions").text

    assert_equal "Change Language", @driver.find_element(:link, "Change Language").text

    assert_equal "Log Out", @driver.find_element(:link, "Log Out").text
  end
end
