class RootController < ApplicationController
  before_action :set_companies_and_technologies, only: [:index, :show]

  # GET /companies
  # GET /companies.json
  def index
    @top_tech = @technologies.sort_by {|t| t.companies.count}.reverse

  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  private

  def company_technologies
    params.require(:company).permit(:technologies)
  end

  def set_companies_and_technologies
    @technologies = Technology.all
    @companies = Company.all
  end

end

