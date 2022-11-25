class GithubApi
  class << self
    def search(term, current_page)
      GithubSearchService.run(term, current_page)
    end
  end
end
