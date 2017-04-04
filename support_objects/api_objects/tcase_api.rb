module ApiObjects
  class TCaseApi
    include HTTParty
    base_uri $BASE_URL

    def initialize()
      @options = {}
    end
  end  
end
