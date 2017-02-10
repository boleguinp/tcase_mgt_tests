require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara-webkit'
require 'active_support'
require 'active_support/core_ext'

# Browser and driver Configurations
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

unless ENV['BROWSER_TYPE'].blank?
  Capybara.default_driver = ENV['BROWSER_TYPE'].to_sym
else
  Capybara.default_driver = :selenium_chrome
end

# Rack app or not
Capybara.run_server = false

# Start a user session
$session = Capybara::Session.new(:selenium_chrome)
