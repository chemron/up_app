class ApplicationController < ActionController::Base
    include HTTParty

    def api_request(query)
        base_url =  "https://api.up.com.au/api/v1/"
        headers = {Authorization: "Bearer #{ENV['up_api_key']}"}
    
        response = HTTParty.get(base_url + query, headers: headers)
        # returns "{}" if response.body does not exist
        response = response&.body || "{}"
        @response_hash = JSON.parse(response)
    end

end
