@ui @project
Feature: Project update
  As a tester
  I want to be able to update my project info
  So that I can manage my project more closely

Background:
  Given I have created a new project

Scenario: Updating  a project
  Given I am on the Home Page
  When I click on My Projects
  And I update my new project
  Then my new project is listed
