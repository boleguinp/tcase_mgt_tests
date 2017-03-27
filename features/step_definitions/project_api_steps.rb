When(/^I send a request to get a list of projects$/) do
  @response = HTTParty.get("http://localhost:3000/projects.json")
  #puts response.body
  #response_xml = Nokogiri::XML response.to_xml
  #puts response_xml
  # puts @response.parsed_response
end

Then(/^I get back a response with a list of projects$/) do
  ## validate_response method here

  puts @response.success?
  puts @response.code
  puts @response.message
  #puts JSON.parse(@response.body)
  #puts @response.headers.inspect
  #puts @response

end

Then(/^it includes the following projects:$/) do |table|
  data = table.hashes
  @result = 0
  for i in 0..data.count-1
    @response.each do |row|
      @expected_title = row.find{row["title"] == data[i]["title"]}
      @expected_description = row.find{row["description"] == data[i]["description"]}
      unless (@expected_title.nil? || @expected_description.nil?)
        @result = @result + 1
        break
      end
    end
    # puts "@expected_title: #{@expected_title}"
    # puts "@expected_description: #{@expected_description}"
  end
  # puts "@result: #{@result}"
  expect(@result).to eq (data.count)
end

When(/^I send a request to create a project$/) do
  #options = {:project => {:title=>"test1", :description=>"test11"}}
  #options = {"utf8"=>"✓", "authenticity_token"=>"tK/8VMppmmZW3UeT4+STphgkD+i4A1H6mXfegunNzU7ULiYq+6OBvaxkwzKWnzad6EzewaR3ndRMN3vuKCHvQA==", "project"=>{"title"=>"gdfgfg", "description"=>"dfgdfg"}, "commit"=>"Create Project"}
  #options = {:headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json', "utf8"=>"✓", "authenticity_token"=>"tK/8VMppmmZW3UeT4+STphgkD+i4A1H6mXfegunNzU7ULiYq+6OBvaxkwzKWnzad6EzewaR3ndRMN3vuKCHvQA=="}, :body =>{:project=> {:title =>"gdfgfg", :description =>"dfgdfg"}}}

  options = {:body =>{:project=> {:title =>'gdfgfg', :description =>'dfgdfg'}}}

  #options = {:headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json'}, :body =>{:project=> {:title =>'gdfgfg', :description =>'dfgdfg'}}}

  #options = {:headers => {'Accept' => 'application/json'}, :body =>{:project=> {:title =>'gdfgfg', :description =>'dfgdfg'}}}

  response = HTTParty.post("http://localhost:3000/projects.json", options)
  puts response.success?
  puts response.code
  puts response.message
  puts response.body
end

Then(/^I get back a confirmation response$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the new project is listed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
