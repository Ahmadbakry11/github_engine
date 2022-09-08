class ReposSearchesController < ApplicationController
  def create
    @repos_search = ReposSearch.new(params[:repos_search])

    unless @repos_search.valid?
      flash[:alert] = "provide more descriptive keywords please"
      redirect_to root_url
    else
      redirect_to root_url(term: params[:repos_search][:term])
    end
  end
end
