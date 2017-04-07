require 'yaml'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara-webkit'
require 'active_support'
require 'active_support/core_ext'
require 'site_prism'
require 'httparty'
require 'nokogiri'
require_relative '../../support_objects/page_objects/tcasemgt/all_page_objects'
require_relative '../../support_objects/api_objects/all_api_objects'


## Environment initialisation
ENV['DOMAIN'] ||= 'dev'
project_root = File.expand_path('./../../..', __FILE__)
$BASE_URL = YAML.load_file(project_root + "/config/config.yml")[ENV['DOMAIN']][:url]

#puts $BASE_URL
#puts ENV['BROWSER_TYPE'].to_sym

## Capybara
# Capybara host
Capybara.app_host = $BASE_URL

## Webkit -- Headless mode
Capybara::Webkit.configure do |config|
  #config.allow_url($BASE_URL)
  #config.allow_url("staging-tcasemgt.herokuapp.com")
  # Allow pages to make requests to any URL without issuing a warning.
  config.allow_unknown_urls
end
# Browser and driver Configurations
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
# Capybara.default_driver = ENV['BROWSER_TYPE'].to_sym

unless ENV['BROWSER_TYPE'].blank?
  Capybara.current_driver = ENV['BROWSER_TYPE'].to_sym
else
  Capybara.current_driver = :selenium_chrome
end

# Rack app or not
Capybara.run_server = false

# Start a user session
# $session = Capybara::Session.new(:selenium_chrome)

## SitePrism
SitePrism.configure do |config|
  config.use_implicit_waits = true
end
