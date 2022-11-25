# class GithubApis
#   @api_endpoint = "https://api.github.com/search/repositories"
  
#   @params = { per_page: 10 }

#   class << self
#     attr_accessor :params, :api_endpoint

#     def search(term, current_page = 1)
#       set_params(term, current_page)
#       api_response = fetch_repos(params)
#       json_response(api_response)
#     end

#     private
    
#     def set_params(term, current_page)
#       params.merge!({
#         "q": term,
#         "page": current_page
#       })
#     end

#     def fetch_repos(params)
#       Faraday.new(
#         url: api_endpoint,
#         params: params
#       ).get
#     end

#     def json_response(res)
#       json_response = JSON.parse(res.body)
#     end
#   end
# end
