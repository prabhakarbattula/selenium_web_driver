require_relative 'test_helper'

class CheckingCatchUpTest < Test::Unit::TestCase
	include CommonMethods

  def test_checking_catch_up
	  login_as_superadmin
    # open | /patients |
    # select | id=select-patient | label=William
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "select-patient")).select_by(:text, "William")
    # verifyText | link=William | William
    assert_equal "William", @driver.find_element(:link, "William").text
    # click | xpath=(//a[contains(text(),'Catch up')])[2] |
    @driver.find_element(:xpath, "(//a[contains(text(),'Catch up')])[2]").click
    # verifyText | css=i.icon-calendar |
    assert_equal "", @driver.find_element(:css, "i.icon-calendar").text
    # verifyElementPresent | css=h1.heading_one |
    assert element_present?(:css, "h1.heading_one")
    # verifyText | css=i.icon-chevron-left |
    #assert_equal "", @driver.find_element(:css, "i.icon-chevron-left").text
    assert element_present?(:css, "i.icon-chevron-left")
    # verifyText | css=i.icon-chevron-right |
    #assert_equal "", @driver.find_element(:css, "i.icon-chevron-right").text
	  assert element_present?(:css, "i.icon-chevron-right")
	  !assert_equal "%{", @driver.find_element(:css,".activity_list>li:contains('%{')").text
    # verifyNotText | glob:*%{* |
    # ERROR: Caught exception [Error: locator strategy either id or name must be specified explicitly.]
		#@driver.find_elements(*args) ⇒ Array<WebDriver::Element>
  end

end
