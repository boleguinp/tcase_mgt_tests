# file: api_objects/application.rb
module ApiObjects
  class Application
    def initialize
      @apis = {}
    end
    def project
      @apis[:project] ||= ApiObjects::ProjectApi.new
    end

    def tcase
      @apis[:tcase] ||= ApiObjects::TCaseApi.new
    end
  end
end
