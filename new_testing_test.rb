require "json"
require "selenium-webdriver"
gem "test-unit"
require "test/unit"
gem "guard-shell"
gem 'rspec_junit_formatter', :git => 'git@github.com:circleci/rspec_junit_formatter.git'

class SuccessWrongemailWrongpassword < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://gmail.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end
  
  def test_success_wrongemail_wrongpassword
    # setSpeed | 0 | 
    # ERROR: Caught exception [ERROR: Unsupported command [setSpeed | 0 | ]]
    # open | /login | 
    @driver.get(@base_url + "/intl/en/mail/help/about.html")
    # type | id=user_email | neerajdnjj@gmail.com
    
    #assert_equal "For mobile", "@driver.find_element(:css, "#nav>li>a:nth(1)").text
    element_present?(:css, "#nav>li>a")
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue Test::Unit::AssertionFailedError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
