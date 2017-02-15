require 'yaml'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara-webkit'
require 'active_support'
require 'active_support/core_ext'
require 'site_prism'
require_relative '../../page_objects/tcasemgt/all_page_objects'

## Environment initialisation
ENV['DOMAIN'] ||= 'staging'
project_root = File.expand_path('./../../..', __FILE__)
$BASE_URL = YAML.load_file(project_root + "/config/config.yml")[ENV['DOMAIN']][:url]

## Capybara
# Capybara host
Capybara.app_host = $BASE_URL
# Browser and driver Configurations
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

## Webkit -- Headless mode
Capybara::Webkit.configure do |config|
  config.allow_url($BASE_URL)
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

## SitePrism
SitePrism.configure do |config|
  config.use_implicit_waits = true
end
