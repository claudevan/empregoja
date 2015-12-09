class JobsController < ApplicationController

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(params.require(:job).permit(:title, :company, :location, :category, :description))
    redirect_to @job
  end

end
