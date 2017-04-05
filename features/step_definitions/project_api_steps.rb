When(/^I send a request to get a list of projects$/) do
  # Response from get method
  @response = @project_api.get_projects
end

When(/^I send a request to create a project$/) do
  # Response from post method new project
  @response = @project_api.post_new_project
end

Then(/^I get back a confirmation response$/) do
  # Validate Response success, status, code
  @api.validate_response(@response)
end

Then(/^it includes the right project$/) do
  # Verify project exists
  @project_id = @project_api.validate_project(@response)
end

Then(/^the new project is listed$/) do
  # Verify project exists
  steps %Q{
    When I send a request to get a list of projects
    Then I get back a confirmation response
    And it includes the right project
        }
end

Given(/^A new project was created$/) do
  # Post new project
  steps %Q{
    When I send a request to create a project
    Then I get back a confirmation response
    And the new project is listed
        }
end
