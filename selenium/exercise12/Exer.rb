require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/naika/OneDrive/Documents/Drivers/chromedriver.exe"

driver = Selenium::WebDriver.for :chrome

driver.manage.window.maximize

wait = Selenium::WebDriver::Wait.new(:timeout => 10)

driver.manage.timeouts.implicit_wait = 3

userName = "user-name"
password = "password"

driver.get "https://www.saucedemo.com/"

username_cont = driver.find_element(:id, userName)
password_cont = driver.find_element(:id, password)
login_btn = driver.find_element(:id, "login-button")

username_cont.send_keys("standard_user")

password_cont.send_keys("secret_sauce")

login_btn.click

backpack_add_card = wait.until { driver.find_element(:id, "add-to-cart-sauce-labs-backpack") }

puts backpack_add_card.location

backpack_add_card.click

shoping_cart = driver.find_element(:id, "shopping_cart_container")
if shoping_cart.displayed?
  shoping_cart.click
end

driver.find_element(:id, "checkout").click

driver.find_element(:id, "first-name").send_keys("ANish")
driver.find_element(:id, "last-name").send_keys("Naik")
driver.find_element(:id, "postal-code").send_keys("403596")
driver.find_element(:id, "continue").click
driver.find_element(:id, "finish").click

shoping_cart = driver.find_element(:id, "shopping_cart_container")

if shoping_cart.displayed?
  shoping_cart.click
end

# postal-code

driver.manage.new_window(:tab)
sleep(5)
driver.close
sleep(5)
# driver.save_screenshot("./ss.png")

driver.quit
