class GithubSearchService < ApplicationService
  @service_address = "https://api.github.com/search/repositories"

  @params = { per_page: 10 }

  class << self
    attr_accessor :params, :service_address

    def run(term, current_page)
      set_params(term, current_page)
      service_response(params)
    end

    private
    
    def set_params(term, current_page)
      params.merge!({
        "q": term,
        "page": current_page
      })
    end
  end
end
