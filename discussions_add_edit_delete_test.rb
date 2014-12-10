require_relative 'test_helper'

class DiscussionsAddEditDeleteTest < Test::Unit::TestCase
	include CommonMethods
    
  def test_discussions_add_edit_delete
    login_as_superadmin
    # open | /patients | 
    @driver.get(@base_url + "/patients")
    
    # select | css=#select-patient | label=William
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:css, "#select-patient")).select_by(:text, "William")
    
    # click | xpath=(//a[contains(text(),'Discussions')])[2] | 
    @driver.find_element(:xpath, "(//a[contains(text(),'Discussions')])[2]").click
    
    # click | css=img[alt="Add"] | 
    @driver.find_element(:css, "img[alt=\"Add\"]").click
    
    # waitForVisible | css=#modal_new_discussion_form | 
    # assert !60.times{ break if (@driver.find_element(:css, "#modal_new_discussion_form").displayed? rescue false); sleep 1 }
    wait_for_element(:class, "modal-content")

    # verifyText | css=div.modal-header > h2:contains(create discussion) | create discussion
     assert_equal "create discussion", @driver.find_element(:css, "div.modal-header > h2:contains(create discussion)").text 
   
    # verifyText | css=label.control-label.col-sm-4:nth(0) | Title
     assert_equal "Title", @driver.find_element(:css, "label.control-label.col-sm-4:nth(0)").text 
    
    # verifyText | css=#discussion_title | 
     assert_equal "", @driver.find_element(:css, "#discussion_title").text 
    
    # verifyText | css=.control-label.col-sm-4:nth(1) | Description
     assert_equal "Description", @driver.find_element(:css, ".control-label.col-sm-4:nth(1)").text 
    # verifyText | css=#discussion_description | 
     assert_equal "", @driver.find_element(:css, "#discussion_description").text 
    # verifyText | css=#upload-file-link | Attach a file
     assert_equal "Attach a file", @driver.find_element(:css, "#upload-file-link").text 
    # verifyText | css=div.col-md-10.col-md-offset-2 > div.col-sm-3 | Share With
     assert_equal "Share With", @driver.find_element(:css, "div.col-md-10.col-md-offset-2 > div.col-sm-3").text 
    # verifyText | css=label:contains(Select All) | Select All
     assert_equal "Select All", @driver.find_element(:css, "label:contains(Select All)").text 
    # verifyText | css=label:contains(Vipul A M) | Vipul A M
     assert_equal "Vipul A M", @driver.find_element(:css, "label:contains(Vipul A M)").text 
    # verifyText | link=× | ×
     assert_equal "×", @driver.find_element(:link, "×").text 
    # verifyText | css=a.btn-next > span | submit
     assert_equal "submit", @driver.find_element(:css, "a.btn-next > span").text 
    # type | css=#discussion_title | spending time
    @driver.find_element(:css, "#discussion_title").clear
    @driver.find_element(:css, "#discussion_title").send_keys "spending time"
    # click | css=a.btn-next > span | 
    @driver.find_element(:css, "a.btn-next > span").click
    # verifyText | css=div.alert.fade.in.alert-success.alert-dismissable | ×Discussion was successfully created.
     assert_equal "×Discussion was successfully created.", @driver.find_element(:css, "div.alert.fade.in.alert-success.alert-dismissable").text 
    # click | css=button.close | 
    @driver.find_element(:css, "button.close").click
    # selectWindow | null | 
    # ERROR: Caught exception [ERROR: Unsupported command [selectWindow | null | ]]
    # stores the targeted value to a variable username
    # storeText | css=span.user_name | userName
    userName = @driver.find_element(:css, "span.user_name").text
    # echo | ${userName | 
    p userName
    # storeText | css=div.discussion_participants > div > span.name | partName
    partName = @driver.find_element(:css, "div.discussion_participants > div > span.name").text
    # echo | ${partName | 
    p partName
    # verifyEval | storedVars['userName']==storedVars['partName'] | true
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | storedVars['userName']==storedVars['partName'] | ]]
    # verifyText | css=i.icon-plus | 
     assert_equal "", @driver.find_element(:css, "i.icon-plus").text 
    # verifyText | css=i.icon-pencil | 
     assert_equal "", @driver.find_element(:css, "i.icon-pencil").text 
    # verifyText | css=i.icon-remove | 
     assert_equal "", @driver.find_element(:css, "i.icon-remove").text 
    # click | css=i.icon-pencil | 
    @driver.find_element(:css, "i.icon-pencil").click
    # waitForVisible | css=#discussion_title | 
    assert !60.times{ break if (@driver.find_element(:css, "#discussion_title").displayed? rescue false); sleep 1 }
    # verifyText | css=.modal-header>h2:nth(1) | create discussion
     assert_equal "create discussion", @driver.find_element(:css, ".modal-header>h2:nth(1)").text 
    # verifyText | css=label.control-label.col-sm-4 | Title
     assert_equal "Title", @driver.find_element(:css, "label.control-label.col-sm-4").text 
    # verifyText | css=label.control-label.col-sm-4:contains(Description) | Description
     assert_equal "Description", @driver.find_element(:css, "label.control-label.col-sm-4:contains(Description)").text 
    # verifyText | css=#upload-file-link | Attach a file
     assert_equal "Attach a file", @driver.find_element(:css, "#upload-file-link").text 
    # verifyText | css=div.col-md-10.col-md-offset-2 > div.col-sm-3 | Share With
     assert_equal "Share With", @driver.find_element(:css, "div.col-md-10.col-md-offset-2 > div.col-sm-3").text 
    # verifyText | css=label:contains(Select All) | Select All
     assert_equal "Select All", @driver.find_element(:css, "label:contains(Select All)").text 
    # verifyText | css=a.btn-next > span | submit
     assert_equal "submit", @driver.find_element(:css, "a.btn-next > span").text 
    # type | css=#discussion_title | spending time editing
    @driver.find_element(:css, "#discussion_title").clear
    @driver.find_element(:css, "#discussion_title").send_keys "spending time editing"
    # type | css=#discussion_description | editing.
    @driver.find_element(:css, "#discussion_description").clear
    @driver.find_element(:css, "#discussion_description").send_keys "editing."
    # click | css=label:contains(Vipul A M) | 
    @driver.find_element(:css, "label:contains(Vipul A M)").click
    # click | css=a.btn-next > span | 
    @driver.find_element(:css, "a.btn-next > span").click
    # verifyText | css=div.alert.fade.in.alert-success.alert-dismissable | ×Discussion was successfully updated.
     assert_equal "×Discussion was successfully updated.", @driver.find_element(:css, "div.alert.fade.in.alert-success.alert-dismissable").text 
    # click | css=button.close | 
    @driver.find_element(:css, "button.close").click
    # verifyText | css=img[alt="Add"] | 
     assert_equal "", @driver.find_element(:css, "img[alt=\"Add\"]").text 
    # verifyText | css=h2 | Discussions
     assert_equal "Discussions", @driver.find_element(:css, "h2").text 
    # verifyText | css=.heading:nth(0) | participants
     assert_equal "participants", @driver.find_element(:css, ".heading:nth(0)").text 
    # verifyText | css=.heading:nth(1) | title/description
     assert_equal "title/description", @driver.find_element(:css, ".heading:nth(1)").text 
    # verifyText | css=.heading:nth(2) | comments
     assert_equal "comments", @driver.find_element(:css, ".heading:nth(2)").text 
    # verifyText | css=.heading:nth(3) | actions
     assert_equal "actions", @driver.find_element(:css, ".heading:nth(3)").text 
    # verifyText | css=span.name:contains(Vipul A M) | Vipul A M
     assert_equal "Vipul A M", @driver.find_element(:css, "span.name:contains(Vipul A M)").text 
    # verifyText | link=spending time editing | spending time editing
     assert_equal "spending time editing", @driver.find_element(:link, "spending time editing").text 
    # verifyText | css=p.first_comment.comment | editing.
     assert_equal "editing.", @driver.find_element(:css, "p.first_comment.comment").text 
    # verifyText | css=i.icon-plus | 
     assert_equal "", @driver.find_element(:css, "i.icon-plus").text 
    # verifyText | css=i.icon-pencil | 
     assert_equal "", @driver.find_element(:css, "i.icon-pencil").text 
    # verifyText | css=i.icon-remove | 
     assert_equal "", @driver.find_element(:css, "i.icon-remove").text 
    # store | 0 | delimiter
    delimiter = "0"
    # this extracts that portion of the variable displayname1 using the 4 delimiter 'space' and assign it to a variable compared
    # store | javascript{storedVars['userName'].split(' ')[storedVars['delimiter']] | usernameTrim
    # ERROR: Caught exception [ERROR: Unsupported command [getEval |  | ]]
    # displays the value of the variable compared in the log below.
    # echo | ${usernameTrim | 
    p usernameTrim
    # stores targeted value to a variable displayname
    # storeText | css=span.name:contains(${userName) | displayName
    displayName = @driver.find_element(:css, "span.name:contains(" + userName + ")").text
    # echo | ${displayName | 
    p displayName
    # compared two variables username and displayname to true
    # verifyEval | storedVars['userName']==storedVars['displayName'] | true
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | storedVars['userName']==storedVars['displayName'] | ]]
    # stores targeted value to a variable displayname1
    # storeText | css=div.discussion_date.date_label | smallName
    smallName = @driver.find_element(:css, "div.discussion_date.date_label").text
    # displays the variable displayname1's value in the log below
    # echo | ${smallName | 
    p smallName
    # this is for storing a value for delimiting and assign to a variable delimiter
    # store | 4 | delimiter
    delimiter = "4"
    # this extracts that portion of the variable displayname1 using the 4 delimiter 'space' and assign it to a variable compared
    # store | javascript{storedVars['smallName'].split(' ')[storedVars['delimiter']] | extractedName
    # ERROR: Caught exception [ERROR: Unsupported command [getEval |  | ]]
    # displays the value of the variable compared in the log below.
    # echo | ${extractedName | 
    p extractedName
    # this compares two variables username and compared to true.
    # verifyEval | storedVars['usernameTrim']==storedVars['extractedName'] | true
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | storedVars['usernameTrim']==storedVars['extractedName'] | ]]
    # click | css=i.icon-remove | 
    @driver.find_element(:css, "i.icon-remove").click
    # assertConfirmation | Are you sure you want to delete spending time editing? | 
    assert_match /^Are you sure you want to delete spending time editing[\s\S]$/, close_alert_and_get_its_text()
    # waitForVisible | css=.alert.fade.in.alert-success.alert-dismissable | ×Discussion was successfully removed.
    assert !60.times{ break if (@driver.find_element(:css, ".alert.fade.in.alert-success.alert-dismissable").displayed? rescue false); sleep 1 }
    # verifyText | //div[@id='main']/div/div/section/div/div | ×Discussion was successfully removed.
     assert_equal "×Discussion was successfully removed.", @driver.find_element(:xpath, "//div[@id='main']/div/div/section/div/div").text 
    # click | css=button.close | 
    @driver.find_element(:css, "button.close").click
  end
  
  
end
