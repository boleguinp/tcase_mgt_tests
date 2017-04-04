When(/^I send a request to create a tcase$/) do
  @rdom = rand(1..100)
  @rdom_chr = ('a'..'z').to_a.sample
  @tcase_id = 'TC'+ "#{@rdom}" + "#{@rdom_chr}"
  @tcase_title = 'Title_'+ "#{@rdom}" + "#{@rdom_chr}"
  @tcase_scenario = 'Scenario_'+ "#{@rdom}" + "#{@rdom_chr}"
  @tcase_status = "NotRun"

  options = {:body =>{:t_case=>
    {:t_case_id => @tcase_id,
      :title => @tcase_title,
      :scenario => @tcase_scenario,
      :status => @tcase_status,
      :project_id => @project_id
    }}}
  @response = HTTParty.post("http://localhost:3000/projects/#{@project_id}/t_cases", options)
end

Then(/^the new tcase is listed$/) do
  @response = HTTParty.get("http://localhost:3000/projects/#{@project_id}")
  page = Nokogiri::HTML(@response)
  page.xpath('//tr/td').each do |node|
	  if node.text == @tcase_id
      break
    end
  end
end

Given(/^I have added a new tcase$/) do
  steps %Q{
    When I send a request to create a tcase
    Then I get back a confirmation response
    And the new tcase is listed
  }
end

When(/^I send a request to remove the tcase$/) do
  options = {:body => {:project_id => @project_id,
      :t_case_id => @tcase_id
    }}
  @response = HTTParty.delete("http://localhost:3000/projects/#{@project_id}/t_cases/#{@tcase_id}", options)
end

Then(/^the new tcase is not listed anymore$/) do
  @response = HTTParty.get("http://localhost:3000/projects/#{@project_id}")
  page = Nokogiri::HTML(@response)
  page.xpath('//tr/td').each do |node|
    if node.text == @tcase_id
      expect(node.text == @tcase_id).to eq (false)
    end
  end
end
