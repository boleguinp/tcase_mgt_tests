module ApiObjects
  class TCaseApi
    include HTTParty
    include RSpec::Matchers

    def initialize
      self.class.base_uri $BASE_URL
      @@params = Hash.new
    end

    # Post method for new tcase
    def post_new_tcase(project_id)
      self.class.params
      options = {:body =>{:t_case=>
        {:t_case_id => @@params["id"],
          :title => @@params["title"],
          :scenario => @@params["scenario"],
          :status => @@params["status"],
          :project_id => project_id
        }}}
      self.class.post("/projects/#{project_id}/t_cases", options)
    end

    # Delete method for tcase
    def delete_tcase(project_id)
      options = {:body => {:project_id => project_id,
          :t_case_id => @@params["id"]
        }}
      self.class.delete("/projects/#{project_id}/t_cases/#{@@params['id']}", options)
    end

    # Validate http response
    def validate_tcase(response, should_exist)
      page = Nokogiri::HTML(response)
      domObject = page.xpath('//tr/td')
      for i in 0..domObject.length-1
        if (domObject[i].text == @tcase_id || i>= domObject.length)
          expect(domObject[i].text == @tcase_id).to eq (should_exist)
          break
        end
      end
    end

    private
    def self.params
      @rdom = rand(1..100)
      @rdom_chr = ('a'..'z').to_a.sample
      @@params = {
          "id" => 'TC'+ "#{@rdom}" + "#{@rdom_chr}",
          "title" => 'Title_'+ "#{@rdom}" + "#{@rdom_chr}",
          "scenario" => 'Scenario_'+ "#{@rdom}" + "#{@rdom_chr}",
          "status" => 'NotRun'
      }
    end
  end
end
