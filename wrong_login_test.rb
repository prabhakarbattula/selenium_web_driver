require_relative 'test_helper'

class One < Test::Unit::TestCase
  include CommonMethods
  def test_one
    # setSpeed | 0 |
    # ERROR: Caught exception [ERROR: Unsupported command [setSpeed | 0 | ]]
    # open | /login |
    @driver.get(@base_url + "/login")

    # type | id=user_email | neerajdnjj@gmail.com
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "neerajdnjj@gmail.com"

    # type | id=user_password | welcome
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "welcome"

    # click | css=button.common-btn |
    @driver.find_element(:css, "button.common-btn").click

    wait_for_successful_dismiss_element
    # verifyText | css=div.alert.fade.in.alert-danger.alert-dismissable | ×Invalid email or password.
      assert_equal "×\nInvalid email or password.", @driver.find_element(:css, "div.alert.fade.in.alert-danger.alert-dismissable").text

    # click | css=button.close |
    @driver.find_element(:css, "button.close").click
    
    # type | id=user_email | neeraj12@bigbinary.com
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys "neeraj12@bigbinary.com"

    # type | id=user_password | welcomee
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys "welcomee"

    # click | css=button.common-btn |
    @driver.find_element(:css, "button.common-btn").click

    wait_for_successful_dismiss_element
    # verifyText | css=div.alert.fade.in.alert-danger.alert-dismissable | ×Invalid email or password.
      assert_equal "×\nInvalid email or password.", @driver.find_element(:css, "div.alert.fade.in.alert-danger.alert-dismissable").text

    # click | css=button.close |
    @driver.find_element(:css, "button.close").click
  end
end
