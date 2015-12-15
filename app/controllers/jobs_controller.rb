class JobsController < ApplicationController
  before_action :set_companies, only: [:new, :create, :edit, :update]
  before_action :set_categories, only: [:new, :create, :edit, :update]
  before_action :set_job, only: [:show, :edit, :update]

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render :edit
    end
  end

  private

  def set_categories
    @categories = Category.all
  end

  def set_companies
    @companies = Company.all
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job)
      .permit(:title, :location, :category_id, :description, :featured,
             :company_id)
  end
end
