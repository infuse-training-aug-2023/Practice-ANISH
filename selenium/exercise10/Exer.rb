require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/naika/OneDrive/Documents/Drivers/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

# Column nomber
col = 2

driver.get "https://computer-database.gatling.io/computers"

table = driver.find_element(:tag_name, "table")

driver.quit
