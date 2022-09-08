describe 'Our GithubApi gateway and its behaviour with github actual api ' do
  describe "Provide a valid search term and getting response" do
    let(:search_response) { GithubApi.search("ruby") }

    it "returns correctly some repos from the github api" do
      expect(search_response).to be_kind_of(Hash)
      expect(search_response).to have_key("items")
      expect(search_response).to have_key("total_count")
    end
  end

  describe "Provide an empty search term or ignoring it" do
    let(:search_response) { GithubApi.search("") }
    let(:expected_response) {
      {
        "documentation_url" => "https://docs.github.com/v3/search",
        "errors" => [
          {
            "resource" => "Search",
            "field" => "q",
            "code" => "missing"
          }
        ],
        "message" => "Validation Failed"
      }
    }

    it "receives an error message from the github api with q field missing" do
      expect(search_response).to match(expected_response)
    end
  end

  describe 'Requesting more than 1k repos from the api' do
    let(:search_response) { GithubApi.search("ruby", 500) }
    let(:expected_response) {
      {
        "message" => "Only the first 1000 search results are available",
        "documentation_url" => "https://docs.github.com/v3/search/"
      }
    }

    it "it receives a message stating 1k repos for that search endpoint" do
      expect(search_response).to match(expected_response)
    end
  end
end
