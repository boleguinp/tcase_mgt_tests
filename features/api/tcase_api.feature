Feature: TCase API testing
  As a tester
  I want to be able to submit GET, POST, PATCH, PUT and DELETE requests to a web service
  So that I can add, update, remove test cases from a project

Background:
  Given I have setup a new project

# Scenario: Creating a tcase
#   When I send a request to create a tcase:
#   |tcase_id |title       |scenario       |status |
#   |TC021    |tcase_title |tcase_scenario |NotRun |
#   Then I get back a confirmation response
#   And the new tcase is listed

Scenario: Removing a tcase
  Given I have added a new tcase
  When I send a request to remove the tcase
  Then I get back a confirmation response
  And the new tcase is removed
