require 'rails_helper'

RSpec.describe ReposSearch, type: :model do
  let!(:repos_search_instance) { ReposSearch.new(term: search_term)}

  context "When the search term is valid" do
    let(:search_term) { "Elm" }
    it "returns a valid reposSearch instance" do
      expect(repos_search_instance).to be_valid
    end
  end

  context "When the search term is not valid" do
    let(:search_term) { "" }
    it "returns a valid reposSearch instance" do
      expect(repos_search_instance).not_to be_valid
    end
  end
end
