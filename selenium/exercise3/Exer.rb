require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/naika/OneDrive/Documents/Drivers/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.get "https://demo.automationtesting.in/Register.html"

refresh_btn = driver.find_element(:id, "Button1")
refresh_btn.click

driver.quit
