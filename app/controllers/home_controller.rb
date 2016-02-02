class HomeController < ApplicationController
  def index
    @jobs = Job.not_expired
    @companies = Company.all
    @categories = Category.all
  end
end
