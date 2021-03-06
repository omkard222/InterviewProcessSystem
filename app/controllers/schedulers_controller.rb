class SchedulersController < ApplicationController


  def index
    @schedulers = Scheduler.includes(:feedbacks).all
    @employee_feedback = Scheduler.where(user_id: current_user.id)
    @projects = Project.where(user_id: current_user.id)
    @a = @projects.pluck(:id)
    @b = Requirement.where("project_id IN (?)", @a)
    @c = @b.pluck(:id)
    @d =Scheduler.where("requirement_id IN (?)", @c)
  end

  def new
    @requirement = Requirement.find(params[:requirement_id])
    @candidate = Candidate.find(params[:candidate_id])
    @scheduler = @candidate.schedulers.build
    @users = User.all
  end


  def show
    @scheduler= Scheduler.find(params[:id])
  end

  def create
    @requirement = Requirement.find(params[:requirement_id])
    @candidate = Candidate.find(params[:candidate_id])
    @scheduler =  @candidate.schedulers.new(schedulers_params)
    @scheduler.requirement_id = params[:requirement_id]

      respond_to do |format|
        @scheduler.save
        InterviewInfoMailer.candidate_information(@scheduler).deliver
        format.html {render 'show', notice: 'Interview schedule' }
      end

  end

  def update
    respond_to do |format|
      if @scheduler.update(schedulers_params)
        format.html { redirect_to @scheduler , notice: 'Interview was successfully updated.' }
        format.json { render :show, status: :ok, location: @scheduler }
      else
        format.html { render :edit }
        format.json { render json: @scheduler.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def schedulers_params
    params.require(:scheduler).permit(:start_time, :end_time, :interview_date, :candidate_id, :user_id, :requirement_id)
  end


end
