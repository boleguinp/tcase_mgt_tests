Given(/^I have setup a new project$/) do
  step "I send a request to create a project:", table([
  %w{ title  description },
  %w{ Project_49r Proj_Description_49r }
  ])
  steps %Q{
  Then I get back a confirmation response
  And the new project is listed
  }
end

When(/^I send a request to create a tcase:$/) do |table|
  @tcase_data = table.hashes
  options = {:body =>{:t_case=>
    {:t_case_id => @tcase_data[0]["tcase_id"],
      :title => @tcase_data[0]["title"],
      :scenario => @tcase_data[0]["scenario"],
      :status => @tcase_data[0]["status"],
      :project_id => @project_id
    }}}
  @response = HTTParty.post("http://localhost:3000/projects/#{@project_id}/t_cases", options)
end

Then(/^the new tcase is listed$/) do
  @response = HTTParty.get("http://localhost:3000/projects/#{@project_id}")

  page = Nokogiri::HTML(@response)
  #
  # mybody = page.css('td').count
  # mytext = page.find('TC04')
  # puts mybody
  # puts mytext
  #
  # tcase_id = page.find(text: 'TC01')
  # puts tcase_id
  page.xpath('//tr/td').each do |node|
	  if node.text == @tcase_data[0]["tcase_id"]
      break
    end
  end
end

Given(/^I have added a new tcase$/) do
  step "I send a request to create a tcase:", table([
    %w{ tcase_id title  scenario status},
    %w{ TC11 tcase_title tcase_scenario NotRun}
  ])
  steps %Q{
    Then I get back a confirmation response
    And the new tcase is listed
  }
end

When(/^I send a request to remove the tcase$/) do
  options = {:body => {:project_id => @tcase_data[0]["tcase_id"],
      :id => @tcase_data[0]["title"],
    }}
  @response = HTTParty.delete("http://localhost:3000/projects/#{@project_id}/t_cases", options)
end

Then(/^the new tcase is removed$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
