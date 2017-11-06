module CheckrCanada
  class Client
    def initialize(apikey = CheckrCanada.config.apikey)
      @apikey = apikey
      @conn = Faraday.new(url: "https://api.checkr.com/") do |f|
        f.request :url_encoded
        f.adapter Faraday.default_adapter

        f.basic_auth(@apikey, nil)
        f.headers['Accept'] = 'application/json'
      end
    end

    def get(url, **params)
      internal_response = @conn.get(url, params)
      CheckrCanada::Response.new(internal_response)
    end

    def post(url, **params)
      internal_response = @conn.post(url, params)
      CheckrCanada::Response.new(internal_response)
    end

    def put(url, **params)
      internal_response = @conn.put(url, params)
      CheckrCanada::Response.new(internal_response)
    end
  end
end
