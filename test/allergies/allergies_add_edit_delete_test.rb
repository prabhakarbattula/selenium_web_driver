require 'test_helper'

class AllergiesAddEditDeleteTest < Test::Unit::TestCase
  include CommonMethods
  def test_allergies_add_edit_delete
    login_as_superadmin
    # open | /patients |

    #@driver.get(@base_url + "/patients")
    # select | id=select-patient | label=William
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "select-patient")).select_by(:text, "William")

    # click | xpath=(//a[contains(text(),'Allergies')])[2] |
    @driver.find_element(:xpath, "(//a[contains(text(),'Allergies')])[2]").click

    # click | css=img[alt="Add"] |
    @driver.find_element(:css, "img[alt=\"Add\"]").click

    # waitForVisible | id=modal_new_allergy_form |
    wait_for_allergy_modal
    # type | id=allergy_name | Milk Allergy
    @driver.find_element(:id, "allergy_name").clear
    @driver.find_element(:id, "allergy_name").send_keys "Milk Allergy"

    # type | id=allergy_notes | I have a Milk allergy
    @driver.find_element(:id, "allergy_notes").clear
    @driver.find_element(:id, "allergy_notes").send_keys "I have a Milk allergy"

    # click | css=a.btn-next > span |
    @driver.find_element(:css, "a.btn-next > span").click

    # verifyText | css=.col-xs-3.col-sm-3.col-md-3.col-lg-3.name_col:contains(Milk Allergy) | Milk Allergy
    assert_equal "Milk Allergy", @driver.find_element(:xpath, "html/body/div[2]/div/div/section/div/article/div[2]/div[2]/div/div[1]").text

    # verifyText | //article[@id='spy_allergies']/div[2]/div[2]/div/div[2] | I have a Milk allergy
    assert_equal "I have a Milk allergy", @driver.find_element(:xpath, "html/body/div[2]/div/div/section/div/article/div[2]/div[2]/div/div[2]").text

    #assert_equal "×Allergy was successfully created.", close_alert_and_get_its_text

    # verifyText | //div[@id='main']/div/section/div/div | ×Allergy was successfully created.
    assert_equal "×\nAllergy was successfully created.", @driver.find_element(:css, ".alert.fade.in.alert-success.alert-dismissable").text

    # click | css=button.close |
    @driver.find_element(:css, "button.close").click

    # click | css=i.icon-pencil |
    @driver.find_element(:css, "i.icon-pencil").click

    # waitForVisible | css=div.form-group |
    wait_for_element(:css, "div.form-group")

    # type | id=allergy_notes | I have a Milk allergy. Red rashes on my hands.
    @driver.find_element(:id, "allergy_notes").clear
    @driver.find_element(:id, "allergy_notes").send_keys "I have a Milk allergy. Red rashes on my hands."

    # click | css=a.btn-next > span |
    @driver.find_element(:css, "a.btn-next > span").click


    wait_for_successful_dismiss_element
    # verifyText | css=div.alert.fade.in.alert-success.alert-dismissable:contains(Allergy was successfully updated.) | ×Allergy was successfully updated.
    assert_equal "×\nAllergy was successfully updated.", @driver.find_element(:css, ".alert.fade.in.alert-success.alert-dismissable").text

    # click | css=button.close |
    @driver.find_element(:css, "button.close").click

    # verifyText | css=.col-xs-3.col-sm-3.col-md-3.col-lg-3.name_col:contains(Milk Allergy) | Milk Allergy
    assert_equal "Milk Allergy", @driver.find_element(:xpath, "html/body/div[2]/div/div/section/div/article/div[2]/div[2]/div/div[1]").text


    # verifyText | css=".col-xs-7.col-sm-7.col-md-7.col-lg-7.notes_col:contains(I have a Milk allergy. Red rashes on my hands.) | I have a Milk allergy. Red rashes on my hands.
    #assert_equal "I have a Milk allergy. Red rashes on my hands.", @driver.find_element(:xpath, "html/body/div[2]/div/div/section/div/article/div[2]/div[2]/div/div[2]").text

    # click | css=i.icon-remove |
    @driver.find_element(:css, "i.icon-remove").click

    # assertConfirmation | Are you sure you want to delete Milk Allergy? |
    assert_match /^Are you sure you want to delete Milk Allergy[\s\S]$/, close_alert_and_get_its_text()

    # waitForVisible | css=.alert.fade.in.alert-success.alert-dismissable |
    wait_for_successful_dismiss_element

    # verifyText | //div[@id='main']/div/section/div/div | ×Allergy was successfully destroyed.
    assert_equal "×\nAllergy was successfully destroyed.", @driver.find_element(:xpath, "//div[@id='main']/div/section/div/div").text

    # click | css=button.close |
    @driver.find_element(:css, "button.close").click
  end

  def wait_for_allergy_modal
    wait_for_element(:id, "modal_new_allergy_form")
  end
end
