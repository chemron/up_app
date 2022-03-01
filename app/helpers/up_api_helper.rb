module UpApiHelper
    def api_request(query, access_token)
        base_url =  "https://api.up.com.au/api/v1/"
        headers = {Authorization: "Bearer #{access_token}"}
    
        response = HTTParty.get(base_url + query, headers: headers)
        # returns "{}" if response.body does not exist
        response = response&.body || "{}"
        @response_hash = JSON.parse(response)
    end

    def get_accounts(user)
        accounts = api_request("accounts", user.access_token)["data"]
        return accounts
    end

    def is_access_token_valid?(access_token)
        response = api_request("util/ping", access_token)
        if response["errors"]
            return false
        elsif response["meta"]
            return response["meta"]["statusEmoji"] == "⚡️"
        else
            return false
        end
    end

    def get_total(accounts)
        sum = 0 
        accounts.each do |account|
            sum += account["attributes"]["balance"]["value"].to_i
        end
        return sum
    end
        
end