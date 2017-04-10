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

## Capybara Config
Capybara.configure do |config|
  config.run_server = false
  config.app_host = $BASE_URL
  config.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
  unless ENV['BROWSER_TYPE'].blank?
    config.default_driver = ENV['BROWSER_TYPE'].to_sym
  else
    config.default_driver = :selenium_chrome
  end
end

## Webkit -- Headless mode
Capybara::Webkit.configure do |config|
  #config.allow_url($BASE_URL)
  #config.allow_url("staging-tcasemgt.herokuapp.com")
  # Allow pages to make requests to any URL without issuing a warning.
  config.allow_unknown_urls
end

## SitePrism
SitePrism.configure do |config|
  config.use_implicit_waits = true
end
