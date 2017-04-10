Given(/^I generate unique project data$/) do
  @rdom = rand(1..100)
  @rdom_chr = ('a'..'z').to_a.sample
  @project_title = 'Project_'+ "#{@rdom}" + "#{@rdom_chr}"
  @project_description = 'Proj_Description_'+ "#{@rdom}" + "#{@rdom_chr}"
end

Given(/^I am on the Home Page$/) do
  @index_page = @app.index
  @index_page.load
end

When(/^I click on My Projects$/) do
  @index_page.click_MyProjects
end

When(/^I click on New project$/) do
  @projects_page = @app.projects
  @projects_page.click_NewProject
  @app.validate_page('New Project', page, true)
end

When(/^I save the details for my new project$/) do
  # Generate random char for unique project title
  steps %Q{
    Given I generate unique project data
  }
  # Call Method to create a new project from page object model for /projects/new
  @projects_new_page = @app.newProject
  @projects_new_page.create_NewProject(@project_title, @project_description)
end

Then(/^my new project is listed$/) do
  @app.validate_page(@project_title, page, true)
  @app.validate_page(@project_description, page, true)
end

Given(/^I have created a new project$/) do
  steps %Q{
    Given I am on the Home Page
    When I click on My Projects
    When I click on New project
    When I save the details for my new project
    Then my new project is listed
    }
end

When(/^I remove my new project$/) do
  @projects_page.remove_Project(@project_title, page)
end

Then(/^the project is not listed anymore$/) do
  @app.validate_page(@project_title, page, false)
end

When(/^I update my new project$/) do
  # Storing current project title
  @project_title_old = @project_title
  # Generate random char for unique project title
  steps %Q{
    Given I generate unique project data
  }
  # Click update button for the new project created
  @projects_page = @app.projects
  @projects_page.click_UpdateProject(@project_title_old, page)
  # Call Method to update new project from page object model for /projects/edit
  actual_url = URI.parse(current_url).path
  @projects_edit_page = @app.editProject
  @projects_edit_page.set_page_url(actual_url)
  @projects_edit_page.update_Project(@project_title, @project_description)
end

Then(/^the new project info is displayed$/) do
  steps %Q{
    Then my new project is listed
  }
end
