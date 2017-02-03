
Given(/^I am on the Home Page$/) do
  visit 'https://staging-tcasemgt.herokuapp.com/'
  ## visit 'http://localhost:3000/'
  ## puts current_url; require 'pry'; binding.pry
end

When(/^I click on My Projects$/) do
  click_link 'My Projects'
end

When(/^I click on New Project$/) do
  click_link 'New Project'
end

When(/^I save the details for my new project$/) do
  @rdom = rand(1..100)
  @rdom_chr = ('a'..'z').to_a.sample
  @project_title = 'Project_'+ "#{@rdom}" + "#{@rdom_chr}"
  @project_description = 'Proj_Description_'+ "#{@rdom}" + "#{@rdom_chr}"
  fill_in 'Title', with: @project_title
  fill_in 'Description', with: @project_description
  click_button 'Create Project'
end

Then(/^I should see my newly created project listed$/) do
   page.has_content?('#{@project_title}')
   page.has_content?('#{@project_description}')
   ## puts current_url; require 'pry'; binding.pry
end
