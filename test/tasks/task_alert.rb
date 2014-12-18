require_relative 'test_helper'

class TaskAlert < Test::Unit::TestCase

  include CommonMethods
  
  def test_task_alert
    # open | /patients | 
    @driver.get(@base_url + "/patients")
    # select | id=select-patient | label=William
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "select-patient")).select_by(:text, "William")
    # assertText | link=William | William
    assert_equal "William", @driver.find_element(:link, "William").text
    # click | xpath=(//a[contains(text(),'Manage Tasks')])[2] | 
    @driver.find_element(:xpath, "(//a[contains(text(),'Manage Tasks')])[2]").click
    # click | link=+ | 
    @driver.find_element(:link, "+").click
    # waitForVisible | id=modal_new_task_form | 
    assert !60.times{ break if (@driver.find_element(:id, "modal_new_task_form").displayed? rescue false); sleep 1 }
    # verifyText | css=h2:contains(add a task) | add a task
     assert_equal "add a task", @driver.find_element(:css, "h2:contains(add a task)").text 
    # verifyText | css=h3 | Select a category
     assert_equal "Select a category", @driver.find_element(:css, "h3").text 
    # verifyText | //form[@id='new_task']/div[2]/div/span/label | Daily Routine (meals, bathing, dressing, etc.)
     assert_equal "Daily Routine (meals, bathing, dressing, etc.)", @driver.find_element(:xpath, "//form[@id='new_task']/div[2]/div/span/label").text 
    # verifyText | //form[@id='new_task']/div[2]/div/span[2]/label | Appointment
     assert_equal "Appointment", @driver.find_element(:xpath, "//form[@id='new_task']/div[2]/div/span[2]/label").text 
    # verifyText | //form[@id='new_task']/div[2]/div/span[3]/label | Medication Schedule
     assert_equal "Medication Schedule", @driver.find_element(:xpath, "//form[@id='new_task']/div[2]/div/span[3]/label").text 
    # verifyText | //form[@id='new_task']/div[2]/div/span[4]/label | Vitamin/Supplement Schedule
     assert_equal "Vitamin/Supplement Schedule", @driver.find_element(:xpath, "//form[@id='new_task']/div[2]/div/span[4]/label").text 
    # verifyText | //form[@id='new_task']/div[2]/div/span[5]/label | Medical Monitoring (weight, glucose, etc.)
     assert_equal "Medical Monitoring (weight, glucose, etc.)", @driver.find_element(:xpath, "//form[@id='new_task']/div[2]/div/span[5]/label").text 
    # verifyText | //form[@id='new_task']/div[2]/div/span[6]/label | Care Coverage
     assert_equal "Care Coverage", @driver.find_element(:xpath, "//form[@id='new_task']/div[2]/div/span[6]/label").text 
    # verifyText | //form[@id='new_task']/div[2]/div/span[7]/label | Errands
     assert_equal "Errands", @driver.find_element(:xpath, "//form[@id='new_task']/div[2]/div/span[7]/label").text
    # verifyText | //form[@id='new_task']/div[2]/div/span[8]/label | Transportation
     assert_equal "Transportation", @driver.find_element(:xpath, "//form[@id='new_task']/div[2]/div/span[8]/label").text 
    # verifyText | //form[@id='new_task']/div[2]/div/span[9]/label | Exercise, Social, Activities
     assert_equal "Exercise, Social, Activities", @driver.find_element(:xpath, "//form[@id='new_task']/div[2]/div/span[9]/label").text 
    # verifyText | //form[@id='new_task']/div[2]/div/span[10]/label | House Care (laundry, cleaning, bills, etc.)
     assert_equal "House Care (laundry, cleaning, bills, etc.)", @driver.find_element(:xpath, "//form[@id='new_task']/div[2]/div/span[10]/label").text 
    # verifyText | //form[@id='new_task']/div[2]/div/span[11]/label | Pet Care
     assert_equal "Pet Care", @driver.find_element(:xpath, "//form[@id='new_task']/div[2]/div/span[11]/label").text 
    # verifyText | //form[@id='new_task']/div[2]/div/span[12]/label | Other
     assert_equal "Other", @driver.find_element(:xpath, "//form[@id='new_task']/div[2]/div/span[12]/label").text 
    # verifyText | link=x | x
     assert_equal "x", @driver.find_element(:link, "x").text 
    # verifyText | css=a.btn-next.icon_next > span | next
     assert_equal "next", @driver.find_element(:css, "a.btn-next.icon_next > span").text 
    # click | id=task_category_appointment | 
    @driver.find_element(:id, "task_category_appointment").click
    # click | css=a.btn-next.icon_next > span | 
    @driver.find_element(:css, "a.btn-next.icon_next > span").click
    # waitForVisible | css=div.form-horizontal | 
    assert !60.times{ break if (@driver.find_element(:css, "div.form-horizontal").displayed? rescue false); sleep 1 }
    # verifyText | css=h2:contains(add a task > Appointment) | add a task > Appointment
     assert_equal "add a task > Appointment", @driver.find_element(:css, "h2:contains(add a task > Appointment)").text 
    # verifyText | id=task_name | 
     assert_equal "", @driver.find_element(:id, "task_name").text 
    # verifyText | css=label.control-label.col-sm-1 | Date
     assert_equal "Date", @driver.find_element(:css, "label.control-label.col-sm-1").text 
    # verifyText | css=div.datepicker input.datepicker.form-control.icon_input.hasDatepicker | 
     assert_equal "", @driver.find_element(:css, "div.datepicker input.datepicker.form-control.icon_input.hasDatepicker").text 
    # verifyText | css=div.datepicker > i.icon-calendar | 
     assert_equal "", @driver.find_element(:css, "div.datepicker > i.icon-calendar").text 
    # verifyText | id=task_start_on_time | 
     assert_equal "", @driver.find_element(:id, "task_start_on_time").text 
    # verifyText | css=i.icon-time | 
     assert_equal "", @driver.find_element(:css, "i.icon-time").text 
    # verifyText | id=task_multiple_times | 
     assert_equal "", @driver.find_element(:id, "task_multiple_times").text 
    # verifyText | //form[@id='new_task']/div[3]/label[2] | Occurs multiple times a day
     assert_equal "Occurs multiple times a day", @driver.find_element(:xpath, "//form[@id='new_task']/div[3]/label[2]").text 
    # verifyText | css=label.col-sm-2.col-sm-offset-2 | Times
     assert_equal "Times", @driver.find_element(:css, "label.col-sm-2.col-sm-offset-2").text 
    # verifyText | name=task[start_on_times][] | 
     assert_equal "", @driver.find_element(:name, "task[start_on_times][]").text 
    # verifyText | css=div.icon_input_wrap > i.icon-time | 
     assert_equal "", @driver.find_element(:css, "div.icon_input_wrap > i.icon-time").text 
    # verifyText | css=i.icon-plus | 
     assert_equal "", @driver.find_element(:css, "i.icon-plus").text 
    # verifyText | id=task_repeat | 
     assert_equal "", @driver.find_element(:id, "task_repeat").text 
    # verifyText | css=div.text-left | Repeats
     assert_equal "Repeats", @driver.find_element(:css, "div.text-left").text 
    # click | id=task_repeat | 
    @driver.find_element(:id, "task_repeat").click
    # verifyText | css=label.control-label.col-sm-3 | Repeats every
     assert_equal "Repeats every", @driver.find_element(:css, "label.control-label.col-sm-3").text
    # verifyText | id=task_every | 1 2 3 4
     assert_equal "1 2 3 4", @driver.find_element(:id, "task_every").text 
    # verifyText | id=task_repeats | Day Week Month
     assert_equal "Day Week Month", @driver.find_element(:id, "task_repeats").text 
    # verifyText | css=div.holder > div.form-group > label.control-label.col-sm-3 | Ends
     assert_equal "Ends", @driver.find_element(:css, "div.holder > div.form-group > label.control-label.col-sm-3").text 
    # verifyText | id=task_end_type_on | 
     assert_equal "", @driver.find_element(:id, "task_end_type_on").text
    # verifyText | //form[@id='new_task']/div[6]/div[3]/div/div/div/label | on
     assert_equal "on", @driver.find_element(:xpath, "//form[@id='new_task']/div[6]/div[3]/div/div/div/label").text
    # verifyText | css=div.icon_input_wrap input.form-control.hasDatepicker | 
     assert_equal "", @driver.find_element(:css, "div.icon_input_wrap input.form-control.hasDatepicker").text 
    # verifyText | css=div.icon_input_wrap > i.icon-calendar | 
     assert_equal "", @driver.find_element(:css, "div.icon_input_wrap > i.icon-calendar").text 
    # verifyText | id=task_end_type_after | 
     assert_equal "", @driver.find_element(:id, "task_end_type_after").text 
    # verifyText | //form[@id='new_task']/div[6]/div[3]/div/div/div[2]/label | after
     assert_equal "after", @driver.find_element(:xpath, "//form[@id='new_task']/div[6]/div[3]/div/div/div[2]/label").text 
    # verifyText | id=task_occurrences | 
     assert_equal "", @driver.find_element(:id, "task_occurrences").text 
    # verifyText | css=span.label-occurrences | occurrences
     assert_equal "occurrences", @driver.find_element(:css, "span.label-occurrences").text 
    # verifyText | id=task_end_type_never | 
     assert_equal "", @driver.find_element(:id, "task_end_type_never").text 
    # verifyText | //form[@id='new_task']/div[6]/div[3]/div/div/div[3]/label | never
     assert_equal "never", @driver.find_element(:xpath, "//form[@id='new_task']/div[6]/div[3]/div/div/div[3]/label").text 
    # verifyText | css=label.control-label.col-sm-2:contains(Assigned To) | Assigned To
     assert_equal "Assigned To", @driver.find_element(:css, "label.control-label.col-sm-2:contains(Assigned To)").text 
    # verifyText | id=task_user_id | regexp:Person on duty.*
     assert_match /Person on duty.*/, @driver.find_element(:id, "task_user_id").text 
    # verifyText | //form[@id='new_task']/div[8]/label | Reminders
     assert_equal "Reminders", @driver.find_element(:xpath, "//form[@id='new_task']/div[8]/label").text 
    # verifyElementPresent | css=img.help-icon | 
     assert element_present?(:css, "img.help-icon") 
    # verifyElementPresent | css=#task_alert_true | 
     assert element_present?(:css, "#task_alert_true") 
    # verifyText | css=div.col-sm-6 > div.form_items_wrap > span.radio_wrap | Yes
     assert_equal "Yes", @driver.find_element(:css, "div.col-sm-6 > div.form_items_wrap > span.radio_wrap").text 
    # verifyElementPresent | css=#task_alert_false | 
     assert element_present?(:css, "#task_alert_false") 
    # verifyText | //form[@id='new_task']/div[8]/div/div/span[2] | No
     assert_equal "No", @driver.find_element(:xpath, "//form[@id='new_task']/div[8]/div/div/span[2]").text 
    # click | css=#task_alert_true | 
    @driver.find_element(:css, "#task_alert_true").click
    # verifyElementPresent | css=#task_upcoming_alert | 
     assert element_present?(:css, "#task_upcoming_alert") 
    # verifyText | css=label.checkbox | exact:Send upcoming task reminder?
     assert_match /^exact:Send upcoming task reminder[\s\S]$/, @driver.find_element(:css, "label.checkbox").text 
    # verifyElementPresent | css=#task_missed_alert | 
     assert element_present?(:css, "#task_missed_alert") 
    # verifyText | //div[@id='alert-settings']/div[3]/div/div/label | exact:Send missed task reminder?
     assert_match /^exact:Send missed task reminder[\s\S]$/, @driver.find_element(:xpath, "//div[@id='alert-settings']/div[3]/div/div/label").text 
    # click | css=#task_upcoming_alert | 
    @driver.find_element(:css, "#task_upcoming_alert").click
    # verifyText | css=#reminder-alert-timeout > label.control-label.col-sm-2 | Send reminder before
     assert_equal "Send reminder before", @driver.find_element(:css, "#reminder-alert-timeout > label.control-label.col-sm-2").text 
    # verifyText | css=#task_upcoming_alert_timeout_minutes | 5 minutes 15 minutes 30 minutes 45 minutes 1 hour 2 hours 4 hours 24 hours
     assert_equal "5 minutes 15 minutes 30 minutes 45 minutes 1 hour 2 hours 4 hours 24 hours", @driver.find_element(:css, "#task_upcoming_alert_timeout_minutes").text 
    # click | css=#task_upcoming_alert | 
    @driver.find_element(:css, "#task_upcoming_alert").click
    # click | css=#task_missed_alert | 
    @driver.find_element(:css, "#task_missed_alert").click
    # verifyText | css=#missed-alert-timeout > label.control-label.col-sm-2 | Notify after
     assert_equal "Notify after", @driver.find_element(:css, "#missed-alert-timeout > label.control-label.col-sm-2").text 
    # verifyText | css=#task_missed_alert_timeout_minutes | 5 minutes 15 minutes 30 minutes 45 minutes 1 hour 2 hours 4 hours 24 hours
     assert_equal "5 minutes 15 minutes 30 minutes 45 minutes 1 hour 2 hours 4 hours 24 hours", @driver.find_element(:css, "#task_missed_alert_timeout_minutes").text 
    # click | css=#task_missed_alert | 
    @driver.find_element(:css, "#task_missed_alert").click
    # verifyText | //div[@id='alert-settings']/div[5]/label | Notification recipients
     assert_equal "Notification recipients", @driver.find_element(:xpath, "//div[@id='alert-settings']/div[5]/label").text 
    # select | css=#task_user_id | label=Person on duty
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:css, "#task_user_id")).select_by(:text, "Person on duty")
    # verifyValue | css=input#task_alert_user_group_care_team | off
     assert_equal "off", @driver.find_element(:css, "input#task_alert_user_group_care_team").attribute("value") 
    # verifyValue | css=#task_alert_user_group_user_selected | on
     assert_equal "on", @driver.find_element(:css, "#task_alert_user_group_user_selected").attribute("value") 
    # Warning: verifyTextNotPresent may require manual changes
    # verifyTextNotPresent | Notify only* | 
     assert_no_match /^[\s\S]*Notify only[\s\S]*$/, @driver.find_element(:css, "BODY").text 
    # verifyText | //div[@id='alert-settings']/div[5]/div/div[2]/span | Notify everyone on the Care Team
     assert_equal "Notify everyone on the Care Team", @driver.find_element(:xpath, "//div[@id='alert-settings']/div[5]/div/div[2]/span").text 
    # verifyElementPresent | css=#task_alert_user_group_user_selected | 
     assert element_present?(:css, "#task_alert_user_group_user_selected") 
    # verifyText | //div[@id='alert-settings']/div[5]/div/div[3]/span | Let me choose who should be notified
     assert_equal "Let me choose who should be notified", @driver.find_element(:xpath, "//div[@id='alert-settings']/div[5]/div/div[3]/span").text 
    # select | css=#task_user_id | label=Vipul A M
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:css, "#task_user_id")).select_by(:text, "Vipul A M")
    # verifyValue | css=input#task_alert_user_group_assigned_to | on
     assert_equal "on", @driver.find_element(:css, "input#task_alert_user_group_assigned_to").attribute("value") 
    # verifyElementPresent | css=#task_alert_user_group_assigned_to | 
     assert element_present?(:css, "#task_alert_user_group_assigned_to") 
    # verifyText | css=div.col-sm-10 > div.form_items_wrap > span.radio_wrap > label | Notify only Vipul A M
     assert_equal "Notify only Vipul A M", @driver.find_element(:css, "div.col-sm-10 > div.form_items_wrap > span.radio_wrap > label").text 
    # verifyElementPresent | css=#task_alert_user_group_care_team | 
     assert element_present?(:css, "#task_alert_user_group_care_team") 
    # verifyText | //div[@id='alert-settings']/div[5]/div/div[2]/span | Notify everyone on the Care Team
     assert_equal "Notify everyone on the Care Team", @driver.find_element(:xpath, "//div[@id='alert-settings']/div[5]/div/div[2]/span").text 
    # verifyElementPresent | css=#task_alert_user_group_user_selected | 
     assert element_present?(:css, "#task_alert_user_group_user_selected") 
    # verifyText | //div[@id='alert-settings']/div[5]/div/div[3]/span | Let me choose who should be notified
     assert_equal "Let me choose who should be notified", @driver.find_element(:xpath, "//div[@id='alert-settings']/div[5]/div/div[3]/span").text 
    # click | css=#task_alert_user_group_user_selected | 
    @driver.find_element(:css, "#task_alert_user_group_user_selected").click
    # verifyText | xpath=(//input[@type='checkbox'])[15] | 
     assert_equal "", @driver.find_element(:xpath, "(//input[@type='checkbox'])[15]").text 
    # verifyText | css=label.checkbox:contains('Select All') | Select All
     assert_equal "Select All", @driver.find_element(:css, "label.checkbox:contains('Select All')").text 
    # verifyText | id=upload-file-link | Attach a file
     assert_equal "Attach a file", @driver.find_element(:id, "upload-file-link").text 
    # verifyText | css=label.control-label.col-sm-2:contains(Note) | Note
     assert_equal "Note", @driver.find_element(:css, "label.control-label.col-sm-2:contains(Note)").text 
    # verifyText | id=task_note | 
     assert_equal "", @driver.find_element(:id, "task_note").text 
    # verifyText | css=a.btn-prev.icon_prev > span | back
     assert_equal "back", @driver.find_element(:css, "a.btn-prev.icon_prev > span").text 
    # verifyText | link=× | ×
     assert_equal "×", @driver.find_element(:link, "×").text 
    # verifyText | css=a.btn-next > span | save
     assert_equal "save", @driver.find_element(:css, "a.btn-next > span").text 
    # type | id=task_name | John
    @driver.find_element(:id, "task_name").clear
    @driver.find_element(:id, "task_name").send_keys "John"
    # making date to a week ago
    # storeEval | var d = new Date(); d.setDate(d.getDate() - 6 );  d.toLocaleDateString(); | a
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | var d = new Date(); d.setDate(d.getDate() - 6 );  d.toLocaleDateString(); | ]]
    # echo | ${a} | 
    p a
    # storeEval | '${a}'.split("/")[0] | date1
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | '${a}'.split("/")[0] | ]]
    # storeEval | if (storedVars['date1'] < 10) {storedVars['date1'] = "0" + storedVars['date1']} else {storedVars['date1']}; | fullDate
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | if (storedVars['date1'] < 10) {storedVars['date1'] = "0" + storedVars['date1']} else {storedVars['date1']}; | ]]
    # echo | ${fullDate}; ${date} | 
    p fullDate + "; ${date}"
    # storeEval | '${a}'.split("/")[1] | month
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | '${a}'.split("/")[1] | ]]
    # storeEval | if (storedVars['month'] < 10) {storedVars['month'] = "0" + storedVars['month']} else {storedVars['month']}; | fullMonth
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | if (storedVars['month'] < 10) {storedVars['month'] = "0" + storedVars['month']} else {storedVars['month']}; | ]]
    # echo | ${fullMonth} | 
    p fullMonth
    # storeEval | '${a}'.split("/")[2] | fullYear
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | '${a}'.split("/")[2] | ]]
    # this command of storedVars will print string instead of value of the variable
    # storeEval | storedVars['fullMonth'] + "/" + storedVars['fullDate'] + "/" + storedVars['fullYear']; | previousDate
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | storedVars['fullMonth'] + "/" + storedVars['fullDate'] + "/" + storedVars['fullYear']; | ]]
    # echo | ${previousDate} | 
    p previousDate
    # typeKeys | css=input.datepicker.form-control.icon_input.hasDatepicker | ${previousDate}
    # ERROR: Caught exception [ERROR: Unsupported command [typeKeys | css=input.datepicker.form-control.icon_input.hasDatepicker | ${previousDate}]]
    # storeEval | var d = new Date(); d.setDate(d.getDate()d.getHours()+":" + d.getMinutes()); | 24time
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | var d = new Date(); d.setDate(d.getDate()d.getHours()+":" + d.getMinutes()); | ]]
    # getting time in new zone
    # storeEval | var d = new Date(); var utc = d.getTime() + (d.getTimezoneOffset() * 6000);  | utc
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | var d = new Date(); var utc = d.getTime() + (d.getTimezoneOffset() * 6000);  | ]]
    # echo | ${utc} | 
    p utc
    # storeEval | var d = new Date(); | currentDate 
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | var d = new Date(); | ]]
    # storeEval | var utc = ( ${currentDate}).getTime(); | currentTime
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | var utc = ( ${currentDate}).getTime(); | ]]
    # echo | ${currentTime} | 
    p currentTime
    # storeEval | var d = new Date(${utc} + (3600000 * (-5))); | newTime
    # ERROR: Caught exception [ERROR: Unsupported command [getEval | var d = new Date(${utc} + (3600000 * (-5))); | ]]
    # echo | (${newTime}).toLocaleTimeString(); | 
    p "(" + newTime + ").toLocaleTimeString();"
    #  |  | 
    # ERROR: Caught exception [unknown command []]
    # echo | ${24time} | 
    p 24time
    # type | css=input#task_start_on_time.form-control.icon_input.hasPtTimeSelect | 07:20 AM
    @driver.find_element(:css, "input#task_start_on_time.form-control.icon_input.hasPtTimeSelect").clear
    @driver.find_element(:css, "input#task_start_on_time.form-control.icon_input.hasPtTimeSelect").send_keys "07:20 AM"
    # verifyText | css=label.control-label.col-sm-3 | Repeats every
     assert_equal "Repeats every", @driver.find_element(:css, "label.control-label.col-sm-3").text 
    # verifyText | css=#task_every | 1 2 3 4
     assert_equal "1 2 3 4", @driver.find_element(:css, "#task_every").text 
    # verifyText | css=#task_repeats | Day Week Month
     assert_equal "Day Week Month", @driver.find_element(:css, "#task_repeats").text 
    # verifyText | css=div.holder > div.form-group > label.control-label.col-sm-3 | Ends
     assert_equal "Ends", @driver.find_element(:css, "div.holder > div.form-group > label.control-label.col-sm-3").text 
    # verifyText | css=#task_end_type_on | 
     assert_equal "", @driver.find_element(:css, "#task_end_type_on").text 
    # verifyText | //form[@id='new_task']/div[6]/div[3]/div/div/div/label | on
     assert_equal "on", @driver.find_element(:xpath, "//form[@id='new_task']/div[6]/div[3]/div/div/div/label").text 
    # verifyText | css=input[id^='dp'] | 
     assert_equal "", @driver.find_element(:css, "input[id^='dp']").text 
    # verifyText | css=div.icon_input_wrap > i.icon-calendar | 
     assert_equal "", @driver.find_element(:css, "div.icon_input_wrap > i.icon-calendar").text 
    # verifyText | css=#task_end_type_after | 
     assert_equal "", @driver.find_element(:css, "#task_end_type_after").text
    # verifyText | //form[@id='new_task']/div[6]/div[3]/div/div/div[2]/label | after
     assert_equal "after", @driver.find_element(:xpath, "//form[@id='new_task']/div[6]/div[3]/div/div/div[2]/label").text 
    # verifyText | css=#task_occurrences | 
     assert_equal "", @driver.find_element(:css, "#task_occurrences").text 
    # verifyText | css=span.label-occurrences | occurrences
     assert_equal "occurrences", @driver.find_element(:css, "span.label-occurrences").text 
     assert_equal "", @driver.find_element(:css, "#task_end_type_never").text 
    # verifyText | //form[@id='new_task']/div[6]/div[3]/div/div/div[3]/label | never
     assert_equal "never", @driver.find_element(:xpath, "//form[@id='new_task']/div[6]/div[3]/div/div/div[3]/label").text 
    # verifyValue | css=label.control-label.col-sm-2.text-left>input[checked="checked"]  | on
     assert_equal "on", @driver.find_element(:css, "label.control-label.col-sm-2.text-left>input[checked=\"checked\"]").attribute("value") 
    # select | id=task_repeats | label=Day
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "task_repeats")).select_by(:text, "Day")
    # select | id=task_user_id | label=Vipul A M
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "task_user_id")).select_by(:text, "Vipul A M")
    # click | css=a.btn-next > span | 
    @driver.find_element(:css, "a.btn-next > span").click
    # verifyText | //div[@id='main']/div/div/section/div/div/div | ×Task was successfully created.
     assert_equal "×Task was successfully created.", @driver.find_element(:xpath, "//div[@id='main']/div/div/section/div/div/div").text 
    # click | css=button.close | 
    @driver.find_element(:css, "button.close").click
    # verifyText | css=i.icon-plus | 
     assert_equal "", @driver.find_element(:css, "i.icon-plus").text 
    # verifyText | css=i.icon-pencil | 
     assert_equal "", @driver.find_element(:css, "i.icon-pencil").text 
    # verifyText | css=i.icon-remove | 
     assert_equal "", @driver.find_element(:css, "i.icon-remove").text
    # verifyElementPresent | link=Upcoming Tasks | 
     assert element_present?(:link, "Upcoming Tasks") 
    # verifyElementPresent | link=Completed Tasks | 
     assert element_present?(:link, "Completed Tasks") 
    # verifyElementPresent | link=Missed Tasks | 
     assert element_present?(:link, "Missed Tasks") 
    # verifyText | css=a.pill.active | Upcoming Tasks
     assert_equal "Upcoming Tasks", @driver.find_element(:css, "a.pill.active").text 
    # verifyText | css=label | Sort by:
     assert_equal "Sort by:", @driver.find_element(:css, "label").text 
    # verifyElementPresent | id=sort_sort_by | 
     assert element_present?(:id, "sort_sort_by") 
    # verifyText | link=John | John
     assert_equal "John", @driver.find_element(:link, "John").text 
    # verifyText | css=div.task_details_wrap > div | Repeats daily at 07:20 AM
     assert_equal "Repeats daily at 07:20 AM", @driver.find_element(:css, "div.task_details_wrap > div").text 
    # verifyText | //div[@id='main']/div/div/section/article/div[2]/div[2]/div/div/div/div/div[2]/span | glob:Next scheduled:*
     assert_match /^Next scheduled:[\s\S]*$/, @driver.find_element(:xpath, "//div[@id='main']/div/div/section/article/div[2]/div[2]/div/div/div/div/div[2]/span").text 
    # verifyText | css=span.assigned_name | Vipul A M
     assert_equal "Vipul A M", @driver.find_element(:css, "span.assigned_name").text 
    # click | css=i.icon-pencil | 
    @driver.find_element(:css, "i.icon-pencil").click
    # waitForVisible | id=task_name | 
    assert !60.times{ break if (@driver.find_element(:id, "task_name").displayed? rescue false); sleep 1 }
    # type | id=task_name | John Doe
    @driver.find_element(:id, "task_name").clear
    @driver.find_element(:id, "task_name").send_keys "John Doe"
    # type | id=task_note | Edited.
    @driver.find_element(:id, "task_note").clear
    @driver.find_element(:id, "task_note").send_keys "Edited."
    # click | css=a.btn-next > span | 
    @driver.find_element(:css, "a.btn-next > span").click
    # verifyText | //div[@id='main']/div/div/section/div/div/div | ×Task was successfully updated.
     assert_equal "×Task was successfully updated.", @driver.find_element(:xpath, "//div[@id='main']/div/div/section/div/div/div").text 
    @driver.find_element(:css, "button.close").click
    # verifyText | link=John Doe | John Doe
     assert_equal "John Doe", @driver.find_element(:link, "John Doe").text 
    # verifyText | css=div.task_note | Task notes Edited.
     assert_equal "Task notes Edited.", @driver.find_element(:css, "div.task_note").text 
    # click | css=i.icon-remove | 
    @driver.find_element(:css, "i.icon-remove").click
    # assertConfirmation | Are you sure you want to delete John Doe | 
    assert_equal "Are you sure you want to delete John Doe", close_alert_and_get_its_text()
    # waitForText | //div[@id='main']/div/div/section/div/div/div | ×Task was successfully removed.
    assert !60.times{ break if (@driver.find_element(:xpath, "//div[@id='main']/div/div/section/div/div/div").text == "×Task was successfully removed." rescue false); sleep 1 }
    # verifyText | //div[@id='main']/div/div/section/div/div/div | ×Task was successfully removed.
     assert_equal "×Task was successfully removed.", @driver.find_element(:xpath, "//div[@id='main']/div/div/section/div/div/div").text 
    # click | css=button.close | 
    @driver.find_element(:css, "button.close").click
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
