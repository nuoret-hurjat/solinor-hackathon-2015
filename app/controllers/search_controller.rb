class SearchController < ApplicationController
  def index
    @companies = []
    @technologies = []
  end
  
  def search
    @companies = ApplicationController.search_by_companies(params[:search])
    @technologies = ApplicationController.search_by_technologies(params[:search])
    render :index
  end
end
