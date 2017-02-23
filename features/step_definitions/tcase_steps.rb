Given(/^I generate unique tcase data$/) do
  @rdom = rand(1..100)
  @rdom_chr = ('a'..'z').to_a.sample
  @tcase_id = 'TC'+ "#{@rdom}" + "#{@rdom_chr}"
  @tcase_title = 'Title_'+ "#{@rdom}" + "#{@rdom_chr}"
  @tcase_scenario = 'Scenario_'+ "#{@rdom}" + "#{@rdom_chr}"
  @tcase_status = "NotRun"
end
Given(/^I view my new project$/) do
  @projects_page = @app.projects
  @projects_page.click_ViewProject(@project_title, page)
end

When(/^I create a test case$/) do
  # Generate random char for unique project title
  steps %Q{
    Given I generate unique tcase data
  }
  # Call Method to update new project from page object model for /projects/edit
  actual_url = URI.parse(current_url).path
  @projects_view_page = @app.viewProject
  @projects_view_page.set_page_url(actual_url)
  @projects_view_page.create_NewTCase(@tcase_id, @tcase_title, @tcase_scenario, @tcase_status)
end

Then(/^my test case is listed$/) do
  @app.checkPage(@tcase_id, page, true)
  @app.checkPage(@tcase_title, page, true)
  click_link 'Back'
end

Given(/^I have created a new tcase$/) do
  steps %Q{
    Given I have created a new project
    Given I am on the Home Page
    And I click on My Projects
    And I view my new project
    When I create a test case
    Then my test case is listed
  }
end

When(/^I remove my new test case$/) do
  @projects_view_page.remove_TCase(@tcase_title, page)
end

Then(/^the test case is not listed anymore$/) do
  @app.checkPage(@tcase_id, page, false)
  @app.checkPage(@tcase_title, page, false)
  click_link 'Back'
end
