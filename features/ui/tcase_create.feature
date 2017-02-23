Feature: TCase Creation
  As a tester
  I want to be able to create test cases for a project
  So that I can manage my test cases per project

Background:
  Given I have created a new project

Scenario: Creating a project
  Given I am on the Home Page
  And I click on My Projects
  And I view my new project
  When I create a test case
  Then my test case is listed
