module CommonMethods
  def setup
    
    @driver = Selenium::WebDriver.for :firefox          
    @base_url = "http://caregeneral.net/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
  end

  def teardown
		logout
    @driver.quit
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

  def close_alert_and_get_its_text
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

  def wait_for_element(type_of_element, element)
    assert !60.times{ break if (@driver.find_element(type_of_element, element).displayed? rescue false); sleep 1 }
  end

  def login_to_site(username, password)
    @driver.get(@base_url + "/login")
    @driver.find_element(:id, "user_email").clear
    @driver.find_element(:id, "user_email").send_keys username
    @driver.find_element(:id, "user_password").clear
    @driver.find_element(:id, "user_password").send_keys password
    @driver.find_element(:css, "button.common-btn").click
    assert_equal "#{username}".split('@').first, @driver.find_element(:css, "span.user_name").text
  end

  def login_as_superadmin
    login_to_site("prabhakar+superadmin@bigbinary.com", "welcome")
  end

  def wait_for_successful_dismiss_element
    wait_for_element(:css, ".alert.fade.in.alert-success.alert-dismissable")
  end

	def logout
		menu_dropdown = @driver.find_element(:css, ".icon-sort-down")
		# using the above element variable moving the mouse to that particular element
		@driver.mouse.move_to menu_dropdown
		@driver.find_element(:link, "Log Out").click
	end

end
