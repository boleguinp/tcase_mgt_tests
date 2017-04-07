When(/^I send a request to create a tcase$/) do
  # Response from post method new tcase
  @response = @tcase_api.post_new_tcase(@project_id)
end

Then(/^the new tcase is "([^"]*)"$/) do |argExist|
  # Verify tcase exists or not
  unless argExist == "listed"
    should_exist = false
  else
    should_exist = true
  end
  @response = @project_api.get_project(@project_id)
  @tcase_api.validate_tcase(@response, should_exist)
end

Given(/^I have added a new tcase$/) do
  steps %Q{
    When I send a request to create a tcase
    Then I get back a confirmation response
    And the new tcase is "listed"
  }
end

When(/^I send a request to remove the tcase$/) do
  # Response from delete method tcase
  @response = @tcase_api.delete_tcase(@project_id)
  # Validate Response success, status, code
  @api.validate_response(@response)
end
