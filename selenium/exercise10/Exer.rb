require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/naika/OneDrive/Documents/Drivers/chromedriver.exe"

$driver = Selenium::WebDriver.for :chrome
