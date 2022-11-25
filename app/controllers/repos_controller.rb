class ReposController < ApplicationController
  before_action :set_repos_search, only: [:index]

  def index
    if params[:term]
      response = GithubApi.search(params[:term], params[:page])
      @repos = paginated_response(response)
      @total_count = response["total_count"]
    else
      @repos = []
    end
  end

  private

  def set_repos_search
    @repos_search = ReposSearch.new
  end

  def paginated_response(response)
    return kaminari_pages(response) if response["items"]
    []
  end

  def kaminari_pages(response)
    Kaminari.paginate_array(
      response["items"],
      total_count: response["total_count"]
    ).page(params[:page])
  end
end
