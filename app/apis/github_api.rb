class GithubApi
  class << self
    def search(term, current_page = 1)
      GithubSearchService.run(term, current_page)
    end
  end
end
