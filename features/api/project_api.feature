Feature: Project API testing
As a tester
I want to be able to submit GET, POST, PATCH, PUT and DELETE requests to my Web Service
So that I can add, update, remove my projects and more

# Scenario: Creating a project
#   When I send a request to create a project
#   Then I get back a confirmation response
#   And the new project is listed
#
# Scenario: Getting my projects list
#   Given A new project was created
#   When I send a request to get a list of projects
#   Then I get back a confirmation response
#   And the new project is listed


  Scenario: Getting projects
    When I send a request to get a list of projects
