require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/naika/OneDrive/Documents/Drivers/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome
driver.get "https://testpages.herokuapp.com/styled/basic-html-form-test.html"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)

dropdown_ele = wait.until { driver.find_elements(:tag_name, "select") }
dropdown = Selenium::WebDriver::Support::Select.new(dropdown_ele[1])

dropdown.select_by(:value, "dd4")
puts dropdown.selected_options[0].text

# select_ele = wait.until { dropdown_ele[1].find_elements(:tag_name, "option") }
# # select_ele.each do |op|
# #   op.click
# #   puts "clicked "
# # end
# select_ele[1].click

# print select_ele[1].text
sleep(10)
driver.quit
