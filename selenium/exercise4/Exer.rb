require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/naika/OneDrive/Documents/Drivers/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.get "https://demo.automationtesting.in/Register.html"

male_radio_btn = driver.find_element(:xpath, "/html/body/section/div/div/div[2]/form/div[5]/div/label[1]/input")
cricket_checkbox = driver.find_element(:id, "checkbox1")

male_radio_btn.click
cricket_checkbox.click

sleep(5)
driver.quit
