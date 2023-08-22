require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/naika/OneDrive/Documents/Drivers/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.get "https://cosmocode.io/automation-practice-webtable/"

table = driver.find_element(:id, "countries")

tableBoday = table.find_element(:tag_name, "tbody")

headers = tableBoday.find_element(:tag_name, "tr")

print(headers.text)

# sleep 5

driver.quit
