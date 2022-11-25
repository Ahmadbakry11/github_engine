module Services
  class ApplicationService
    class << self
      def service_response(url, params)
        response = http_conn(url, params).get
        response_body(response)
      end

      def http_conn(url, params)
        Faraday.new(url: url, params: params) 
      end

      def response_body(res)
        JSON.parse(res.body)
      end
    end
  end
end