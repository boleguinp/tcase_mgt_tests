When(/^I send a request to get a list of projects$/) do
  #@response = HTTParty.get("http://localhost:3000/projects.json")
  @project_api = @api.project
  @response = @project_api.get_projects
  puts @response
end

When(/^I send a request to create a project$/) do
  @rdom = rand(1..100)
  @rdom_chr = ('a'..'z').to_a.sample
  @project_title = 'Project_'+ "#{@rdom}" + "#{@rdom_chr}"
  @project_description = 'Proj_Description_'+ "#{@rdom}" + "#{@rdom_chr}"

  options = {:body =>{:project=> {:title => @project_title, :description => @project_description}}}
  @response = HTTParty.post("http://localhost:3000/projects.json", options)
end

Then(/^I get back a confirmation response$/) do
  ## validate_response method here
  expect(@response.success?).to eq (true)
  expect(@response.code).to eq (200)
  expect(@response.message).to eq ("OK")
end

Then(/^it includes the right project$/) do
  @result = 0
    @response.each do |row|
      @expected_title = row.find{row["title"] == @project_title}
      @expected_description = row.find{row["description"] == @project_description}
      unless (@expected_title.nil? || @expected_description.nil?)
        @result = @result + 1
        @project_id = row["id"]
        break
      end
    end
  expect(@result).to eq (1)
end

Then(/^the new project is listed$/) do
  steps %Q{
    When I send a request to get a list of projects
    Then I get back a confirmation response
    And it includes the right project
        }
end

Given(/^A new project was created$/) do
  steps %Q{
    When I send a request to create a project
    Then I get back a confirmation response
    And the new project is listed
        }
end
