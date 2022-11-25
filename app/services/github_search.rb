module Services
  class GithubSearch < ApplicationService
    @service_address = "https://api.github.com/search/repositories"

    @params = { per_page: 10 }
  
    class << self
      attr_accessor :params, :service_address
  
      def run(term, current_page)
        set_params(term, current_page)
        service_response(service_address, params)
        # github_response = fetch_repos(params)
        # response_body(github_response)
      end
  
      private
      
      def set_params(term, current_page)
        params.merge!({
          "q": term,
          "page": current_page
        })
      end
  
      # def fetch_repos(params)
      #   Faraday.new(
      #     url: service_address,
      #     params: params
      #   ).get
      # end
  
      # def response_body(res)
      #   JSON.parse(res.body)
      # end
    end
  end
end