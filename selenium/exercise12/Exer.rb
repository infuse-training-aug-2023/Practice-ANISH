require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = "C:/Users/naika/OneDrive/Documents/Drivers/chromedriver.exe"

class WebsiteNav
  def initialize
    @driver = Selenium::WebDriver.for :chrome
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    @driver.manage.timeouts.implicit_wait = 3
  end

  def openWebsite()
    @driver.get("https://www.saucedemo.com/")
    @driver.manage.window.maximize
  end

  def login_website(username, password)
    if @driver.title == "Swag Labs"
      username_cont = @driver.find_element(:id, "user-name")
      password_cont = @driver.find_element(:id, "password")
      login_btn = @driver.find_element(:id, "login-button")
      username_cont.send_keys(username)
      password_cont.send_keys(password)
      login_btn.click
    else
      raise "Please Open the Website First"
    end
  end

  def checkout_cart
    shoping_cart = @driver.find_element(:id, "shopping_cart_container")
    if shoping_cart.displayed?
      shoping_cart.click
      @driver.find_element(:id, "checkout").click
    end
  end

  def fill_checkout_details(first_name, last_name, pincode)
    @driver.find_element(:id, "first-name").send_keys(first_name)
    @driver.find_element(:id, "last-name").send_keys(last_name)
    @driver.find_element(:id, "postal-code").send_keys(pincode)
    @driver.find_element(:id, "continue").click
    @driver.find_element(:id, "finish").click
  end

  def add_to_cart(id)
    begin
      add_item = @wait.until { @driver.find_element(:id, id) }
      add_item.click
    rescue => exception
      raise "Failed To add To cart"
    end
  end

  def remove_from_cart(id)
    begin
      remove_item = @wait.until { @driver.find_element(:id, id) }
      remove_item.click
    rescue => exception
      raise "Failed To remove from cart"
    end
  end

  def open_new_tab
    @driver.manage.new_window(:tab)
  end

  def quit_driver
    @driver.quit
  end
end

sauce_nav = WebsiteNav.new()
sauce_nav.openWebsite()

sauce_nav.login_website("standard_user", "secret_sauce")
sauce_nav.add_to_cart("shopping_cart_container")
sauce_nav.checkout_cart
sauce_nav.fill_checkout_details("ANish", "Naik", "403512")

sauce_nav.quit_driver

# shoping_cart = @driver.find_element(:id, "shopping_cart_container")
