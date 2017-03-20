Feature: Project API testing
  As a tester
  I want to be able to submit GET, POST requests to a web service
  So that I can add, update, remove my projects

Scenario: Getting my project listing
  When I send a request to get a list of projects
  Then I get back my saved projects
  And it includes the following projects
  |Title      |Description          |
  |Project_59b|Proj_Description_59b |
  |Project_76c|Proj_Description_76c |
