require 'capybara/cucumber'
require 'selenium-webdriver'

# Browser and driver Configurations
Capybara.register_driver :selenium_safari do |app|
  Capybara::Selenium::Driver.new(app, :browser => :safari)
end

Capybara.default_driver = :selenium_safari


## Capybara.app_host = ENV['app_host']

# Rack app or not
Capybara.run_server = false
# Start a user session
$session = Capybara::Session.new(:selenium_safari)
