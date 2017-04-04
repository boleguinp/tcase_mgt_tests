require 'httparty'
module ApiObjects
  class ProjectApi
    include HTTParty

    def initialize
      @options = {}
      self.class.base_uri $BASE_URL
    end

    def get_projects
      self.class.get("/projects.json")
    end
  end
end
