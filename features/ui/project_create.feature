@ui @project
Feature: Project Creation
  As a tester
  I want to be able to create projects
  So that I can add my test cases later on

Scenario: Creating a project
  Given I am on the Home Page
  When I click on My Projects
  And I click on New project
  And I save the details for my new project
  Then my new project is listed
