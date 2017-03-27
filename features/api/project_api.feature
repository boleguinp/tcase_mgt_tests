Feature: Project API testing
  As a tester
  I want to be able to submit GET, POST, PATCH, PUT and DELETE requests to a web service
  So that I can add, update, remove my projects and more

Scenario: Getting my listing projects
  When I send a request to get a list of projects
  Then I get back a response with a list of projects
  And it includes the following projects:
  |title      |description          |
  |Project_79r|Proj_Description_79r |
  |Project_62v|Proj_Description_62v |
  |Project_20a|Proj_Description_20a |

  Scenario: Creating a project
    When I send a request to create a project
    Then I get back a confirmation response
    And the new project is listed
