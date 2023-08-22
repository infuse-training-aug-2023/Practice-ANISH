require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/naika/OneDrive/Documents/Drivers/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome
driver.get "https://testpages.herokuapp.com/styled/basic-html-form-test.html"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)

dropdown_ele = wait.until { driver.find_elements(:tag_name, "select") }
dropdown_ele[1].click
puts "click dropdown"

select_ele = wait.until { dropdown_ele[1].find_elements(:tag_name, "option") }
# select_ele.each do |op|
#   op.click
#   puts "clicked "
# end
select_ele[1].click

print select_ele[1].text
sleep(10)
driver.quit
