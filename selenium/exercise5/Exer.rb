require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/naika/OneDrive/Documents/Drivers/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.get "http://google.com"

searchinp = driver.find_element(:name, "q")
searchinp.send_keys("Heelo")

searchinp.send_keys(:enter)

# sleep(5)
driver.quit
