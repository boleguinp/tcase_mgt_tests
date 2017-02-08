require 'capybara/cucumber'
require 'selenium-webdriver'

# Browser and driver Configurations
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.default_driver = :selenium_chrome


## Capybara.app_host = ENV['app_host']

# Rack app or not
Capybara.run_server = false
# Start a user session
$session = Capybara::Session.new(:selenium_chrome)
