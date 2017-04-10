@ui @tcase
Feature: TCase removal
  As a tester
  I want to be able to remove tcases
  So that I can manage my test cases per project

Background:
  Given I have created a new tcase

Scenario: Removing a project
  Given I am on the Home Page
  And I click on My Projects
  And I view my new project
  When I remove my new test case
  Then the test case is not listed anymore
