@ui @project
Feature: Project removal
  As a tester
  I want to be able to remove projects
  So that I can keep my listing projects nice and tidy

Background:
  Given I have created a new project

Scenario: Removing a project
  Given I am on the Home Page
  When I click on My Projects
  And I remove my new project
  Then the project is not listed anymore
