require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/naika/OneDrive/Documents/Drivers/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

wait = Selenium::WebDriver::Wait.new(:timeout => 10)

driver.get "https://www.globalsqa.com/demo-site/sliders/#Steps"

driver.switch_to.frame driver.find_element(:xpath, "/html/body/div/div[1]/div[2]/div/div/div[2]/div/div/div[3]/p/iframe")

slider = wait.until { driver.find_element(:id, "slider") }

driver.action.drag_and_drop_by(slider, 10, 0).perform

slider_value = driver.find_element(:id, "amount")

print slider_value.attribute("value")
# sleep(1)
driver.quit
