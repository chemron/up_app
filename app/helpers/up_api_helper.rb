module UpApiHelper
    def api_request(query, user)
        base_url =  "https://api.up.com.au/api/v1/"
        headers = {Authorization: "Bearer #{user.access_token}"}
    
        response = HTTParty.get(base_url + query, headers: headers)
        # returns "{}" if response.body does not exist
        response = response&.body || "{}"
        @response_hash = JSON.parse(response)
    end

    def get_accounts(user)
        accounts = api_request("accounts", user)["data"]
        return accounts
    end

end