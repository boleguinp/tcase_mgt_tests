# tcase_mgt_tests

## Description
Cucumber tests as part of a Demo for full-stack testing

## Install
clone repo
bundle install

## Run cuke tests
* running a feature folder:
cucumber features/ui

* running a feature file:
cucumber features/api/project_api.feature

* using profile for headless browser (webkit):
cucumber features --tags @ui -p headless

* using DOMAIN param to point to env.:
cucumber features/api DOMAIN=staging

* using tags for ui tests:
cucumber features --tags @ui

* using tags for tcase resource tests:
cucumber features --tags @tcase

## Also see:

### Write Cucumber tests
* https://saucelabs.com/blog/write-great-cucumber-tests

### Capybara
* https://github.com/teamcapybara/capybara
* https://www.gamesparks.com/blog/automated-testing-with-cucumber-and-capybara/

### chromedriver
* http://collectiveidea.com/blog/archives/2011/09/27/use-chrome-with-cucumber-capybara

### SitePrism: A POM DSL for Capybara
* http://www.rubydoc.info/gems/site_prism/frames
* https://www.sitepoint.com/testing-page-objects-siteprism/
* http://pmatsinopoulos.github.io/blog/2014/09/21/you-dont-have-to-be-afraid-to-test-your-ui-page-object-pattern-to-the-rescue/
* http://thewanderingcoder.com/2015/06/testing-with-page-objects-setup/

### Page Object Model - for Pages Flow
* http://thewanderingcoder.com/2015/07/testing-with-page-objects-implementation/

### Factory Girl: Manage your test data
* http://jameschambers.co/writing/cucumber-for-beginners-test-data/


### Api & testing
* https://www.twilio.com/blog/2015/10/4-ways-to-parse-a-json-api-with-ruby.html
* http://lazytester.com/mixing-your-cucumber-tests-with-api-helpers/
* http://anthonyeden.com/2013/07/10/testing-rest-apis-with-cucumber-and-rack.html
* http://www.baeldung.com/cucumber-rest-api-testing
* http://gregbee.ch/blog/effective-api-testing-with-cucumber
* http://www.baeldung.com/cucumber-rest-api-testing
* https://www.youtube.com/watch?v=4qSsHY-Lkpg

### debugging
*  puts current_url; require 'pry'; binding.pry
