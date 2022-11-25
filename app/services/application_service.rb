class ApplicationService
  MAX_TRAILS = 5

  @response = {}

  class << self
    def service_response(params)
      @response = http_conn(params).get
      retry_request(params) if request_failed?
      response_body(@response)
    end

    def http_conn(params)
      Faraday.new(url: service_address, params: params) 
    end

    def response_body(res)
      JSON.parse(res.body)
    end

    def retry_request(params)
      MAX_TRAILS.times do
        @response = http_conn(params).get
        return if request_passed?
      end
      raise_time_out_error
    end

    def request_failed?
      @response.status == 500
    end

    def request_passed?
      @response.status == 200
    end

    def raise_time_out_error
      raise ApplicationController::TimeOutError
    end
  end
end
