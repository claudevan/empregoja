class HomeController < ApplicationController
  def index
    company_id = params[:company_id]

    if company_id.nil?
      @jobs = Job.all
    else
      @jobs = Job.where(company_id: company_id)
    end

    @companies = Company.all
  end
end
