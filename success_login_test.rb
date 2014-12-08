require_relative 'test_helper'

class SeleniumTestUnit03122014 < Test::Unit::TestCase
  include CommonMethods

=begin
      def setup
        caps = Selenium::WebDriver::Remote::Capabilities.firefox
        caps.version = "5"
        caps.platform = :XP
        caps[:name] = "Testing Selenium 2 with Ruby on Sauce"

        @driver = Selenium::WebDriver.for(
          :remote,
          :url => "http://prabhakarbattul:212b9ccc-17d1-4c9c-8fe9-9d8257ad63b7@ondemand.saucelabs.com:80/wd/hub",
          :desired_capabilities => caps)
      end
=end

  def test_selenium_test_unit03122014
    @driver.get("http://caregeneral.net/login/")

    assert element_present?(:css, "a.logo.navbar-brand")

    assert_equal "ACCOUNT LOGIN", @driver.find_element(:css, "h1.page-title").text

    assert_equal "", @driver.find_element(:id, "user_email").text

    assert_equal "", @driver.find_element(:id, "user_password").text

    assert_equal "Forgot Password", @driver.find_element(:link, "Forgot Password").text

    assert_equal "Didn't receive unlock instructions?", @driver.find_element(:link, "Didn't receive unlock instructions?").text

    assert_equal "Contact Us", @driver.find_element(:link, "Contact Us").text

    assert_equal "LOGIN", @driver.find_element(:css, "button.common-btn").text

    assert_equal "", @driver.find_element(:id, "badge-app-store").text

    assert_equal "Text me the link", @driver.find_element(:link, "Text me the link").text

    assert_equal "Privacy Policy", @driver.find_element(:link, "Privacy Policy").text

    assert_equal "Terms of Service", @driver.find_element(:link, "Terms of Service").text

    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "prabhakar+superadmin@bigbinary.com"

    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "welcome"

    @driver.find_element(:css, "button.common-btn").click

    assert_equal "prabhakar+superadmin", @driver.find_element(:css, "span.user_name").text


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

    #@driver.action.click(el).release.perform


=begin
    profile = @driver.find_element(:css, ".nav_link")
    # using the above element variable moving the mouse to that particular element
    @driver.mouse.move_to profile
=end
  end
end
