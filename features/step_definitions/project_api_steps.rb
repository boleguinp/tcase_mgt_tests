When(/^I send a request to get a list of projects$/) do
  @response = HTTParty.get("http://localhost:3000/projects.json")
end

Then(/^I get back a response with a list of projects$/) do
  ## validate_response method here
  # puts expect(@response.success?).to eq (true)
  # puts expect(@response.code).to eq (200)
  # puts expect(@response.message).to eq ("OK")
  expect(@response.success?).to eq (true)
  expect(@response.code).to eq (200)
  expect(@response.message).to eq ("OK")

end

Then(/^it includes the following projects:$/) do |table|
  @data = table.hashes
  @result = 0
  for i in 0..@data.count-1
    @response.each do |row|
      @expected_title = row.find{row["title"] == @data[i]["title"]}
      @expected_description = row.find{row["description"] == @data[i]["description"]}
      unless (@expected_title.nil? || @expected_description.nil?)
        @result = @result + 1
        break
      end
    end
    # puts "@expected_title: #{@expected_title}"
    # puts "@expected_description: #{@expected_description}"
  end
  # puts "@result: #{@result}"
  expect(@result).to eq (@data.count)
end

When(/^I send a request to create a project:$/) do |table|
  @data = table.hashes
  options = {:body =>{:project=> {:title => @data[0]["title"], :description => @data[0]["description"]}}}
  @response = HTTParty.post("http://localhost:3000/projects.json", options)
end

Then(/^I get back a confirmation response$/) do
  ## validate_response method here
  puts expect(@response.success?).to eq (true)
  puts expect(@response.code).to eq (200)
  puts expect(@response.message).to eq ("OK")
  # puts @response.body
  # expect(@response.success?).to eq (true)
  # expect(@response.code).to eq (200)
  # expect(@response.message).to eq ("OK")
  # @response.body
end


Then(/^it includes the right project$/) do
  @result = 0
  for i in 0..@data.count-1
    @response.each do |row|
      @expected_title = row.find{row["title"] == @data[i]["title"]}
      @expected_description = row.find{row["description"] == @data[i]["description"]}
      unless (@expected_title.nil? || @expected_description.nil?)
        @result = @result + 1
        @project_id = row["id"]
        break
      end
    end
    # puts "@expected_title: #{@expected_title}"
    # puts "@expected_description: #{@expected_description}"
  end
  # puts "@result: #{@result}"
  expect(@result).to eq (@data.count)
end

Then(/^the new project is listed$/) do
  steps %Q{
    When I send a request to get a list of projects
    Then I get back a response with a list of projects
    And it includes the right project
        }
end
