class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end

  def new
    @companies = Job.new
  end

  private

  def company_params
    params.require(:job)
      .permit(:name, :location, :mail, :phone)
  end
end
