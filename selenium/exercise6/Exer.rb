require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/naika/OneDrive/Documents/Drivers/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.get "https://letcode.in/forms"

wait = Selenium::WebDriver::Wait.new(:timeout => 10)

dropdown_list = wait.until { driver.find_element(:xpath, "/html/body/app-root/app-forms/section[1]/div/div/div[1]/div/div/form/div[5]/div[2]/div/div/div/select") }
dropdown = Selenium::WebDriver::Support::Select.new(dropdown_list)

# dropdown_list = wait.until { driver.find_element(:tag_name, "select") }
dropdown.options.map { |ele| puts ele.text }

driver.quit
