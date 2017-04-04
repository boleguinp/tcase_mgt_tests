Feature: TCase API testing
As a tester
I want to be able to submit GET, POST, PATCH, PUT and DELETE requests to my Web Service
So that I can add, update, remove my test cases and more

Background:
  Given A new project was created

Scenario: Creating a tcase
  When I send a request to create a tcase
  Then I get back a confirmation response
  And the new tcase is listed

Scenario: Removing a tcase
  Given I have added a new tcase
  When I send a request to remove the tcase
  Then I get back a confirmation response
  And the new tcase is not listed anymore
