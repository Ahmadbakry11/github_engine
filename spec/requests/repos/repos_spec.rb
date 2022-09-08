require 'rails_helper'

RSpec.describe "Repos index", type: :request do

  describe 'Requesting the root path of the app' do
    before { get "/" }
    it "returns a nice message to guide you to serach" do
      expect(response.body).to include("Search for public repos")
    end
  end

  describe 'Seaching with a null search term or submitting an empty form ' do
    before { get "/repos?term=" }
    it "returns a nice message to guide you to serach with no errors" do
      expect(response.body).to include("Search for public repos")
    end
  end

  describe 'Searching with a valid search term' do
    before { get "/repos?term=ruby" }
    it "returns the html with repos seach results" do
      expect(response.body).to include("repository results")
    end
  end
end
