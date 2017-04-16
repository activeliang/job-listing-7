class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      redirect_to "/", warning: "This Job is alread archieved"
    end
  end

  def index
    @jobs = case params[:order]
    when 'by_lower_bound'
      Job.published.order('wage_lower_bound DESC')
    when 'by_upper_bound'
      Job.published.order('wage_upper_bound DESC')
    else
      Job.published.recent
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path, notice: "created!"
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path, notice: "updated!"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      redirect_to jobs_path, danger: "Deleted!"
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :description,:wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end
end
