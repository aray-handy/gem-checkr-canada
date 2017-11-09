module CheckrCanada
  class Response
    def initialize(response)
      @internal_response = response
    end

    def status
      @internal_response.status
    end

    def error?
      status / 100 != 2
    end

    def error_message
      if error?
        body[:error]
      else
        ""
      end
    end

    def body
      if @internal_response.body == ""
        {}
      else
        JSON.parse(@internal_response.body)
      end
    end
  end
end
