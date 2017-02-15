
Given(/^I am on the Home Page$/) do

  @index_page = @app.index
  # puts current_url; require 'pry'; binding.pry
  @index_page.load

end

When(/^I click on My Projects$/) do
  @index_page.click_MyProjects
end

When(/^I click on my new project$/) do
  @projects_page = @app.projects
  @projects_page.click_NewProject
  @app.checkPage('New Project', page)
end

When(/^I save the details for my new project$/) do
  # Genenerate random char for unique project title
  @rdom = rand(1..100)
  @rdom_chr = ('a'..'z').to_a.sample
  @project_title = 'Project_'+ "#{@rdom}" + "#{@rdom_chr}"
  @project_description = 'Proj_Description_'+ "#{@rdom}" + "#{@rdom_chr}"

  # Call Method to create a new project from page object model for /projects/new
  @projects_new_page = @app.newProject
  @projects_new_page.create_NewProject(@project_title, @project_description)
end

Then(/^I should see my newly created project listed$/) do
  @app.checkPage(@project_title, page)
  @app.checkPage(@project_description, page)
end


Given(/^I have created a new project$/) do
  steps %Q{
    Given I am on the Home Page
    When I click on My Projects
    When I click on New Project
    When I save the details for my new project
    Then I should see my newly created project listed
    }
end

When(/^I remove my new project$/) do
  # puts "project_title: #{@project_title}"
  # @project_title = 'Project_16g'
  # page.find(:xpath, '//tr/td', text: @project_title)
  # page.find(:xpath, '//tr/td', text: @project_title)
  @tr = page.find(:xpath, '//tr/td', text: @project_title).find(:xpath, '..')
  # puts current_url; require 'pry'; binding.pry

  unless ENV['BROWSER_TYPE'].blank?
    @tr.find(:xpath, 'td', text: 'Remove').click_link('Remove')
  else
    accept_alert do
      @tr.find(:xpath, 'td', text: 'Remove').click_link('Remove')
    end
  end

end
Then(/^The project should not be listed anymore$/) do
  page.has_no_content?('#{@project_title}')
end
