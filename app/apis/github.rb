module Apis
  class Github
    class << self
      def search(term, current_page)
        Services::GithubSearch.run(term, current_page)
      end
    end
  end
end