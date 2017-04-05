# file: api_objects/application.rb
module ApiObjects
  class Application
    include RSpec::Matchers
    def initialize
      @apis = {}
    end
    def project
      @apis[:project] ||= ApiObjects::ProjectApi.new
    end

    def tcase
      @apis[:tcase] ||= ApiObjects::TCaseApi.new
    end

    def validate_response(response)
      expect(response.success?).to eq (true)
      expect(response.code).to eq (200)
      expect(response.message).to eq ("OK")
    end
  end
end
