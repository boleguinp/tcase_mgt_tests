module ApiObjects
  class ProjectApi
    include HTTParty
    include RSpec::Matchers

    def initialize
      self.class.base_uri $BASE_URL
      @@params = Hash.new
    end

    # Get method for projects
    def get_projects
      self.class.get("/projects.json")
    end

    # Get method for project
    def get_project(project_id)
      self.class.get("/projects/#{project_id}")
    end

    # Post method for new project
    def post_new_project
      self.class.params
      options = {:body =>{:project=>
        {:title => @@params["title"],
        :description => @@params["description"]}}}
      self.class.post("/projects.json", options)
    end

    # Delete method for project
    def delete_project(project_id)
      options = {:body => {:project_id => project_id
        }}
      self.class.delete("/projects/#{project_id}", options)
    end

    # Validate http response
    def validate_project(response)
      result = 0
      project_id = ""
      response.each do |row|
        expected_title = row.find{row["title"] == @@params["title"]}
        expected_description = row.find{row["description"] == @@params["description"]}
        unless (expected_title.nil? || expected_description.nil?)
          result = result + 1
          project_id = row["id"]
          break
        end
      end
      expect(result).to eq (1)
      return project_id
    end

    private
    def self.params
      @rdom = rand(1..100)
      @rdom_chr = ('a'..'z').to_a.sample
      @@params = {
          "title" => 'Project_'+ "#{@rdom}" + "#{@rdom_chr}",
          "description" => 'Proj_Description_'+ "#{@rdom}" + "#{@rdom_chr}"
      }
    end
  end
end
