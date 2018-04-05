class SchedulersController < ApplicationController

  def new
    @requirement = Requirement.find(params[:requirement_id])
    @candidate = Candidate.find(params[:candidate_id])
    # debugger
    @scheduler = @candidate.build_scheduler
  end

  def show
    @scheduler= Scheduler.find(params[:id])
  end

  def create
    @requirement = Requirement.find(params[:requirement_id])
    @candidate = Candidate.find(params[:candidate_id])
    @scheduler = @candidate.build_scheduler(schedulers_params)
    @scheduler.requirement_id = params[:requirement_id]

    respond_to do |format|
      if @scheduler.save
        format.html {redirect_to @scheduler, notice: 'Interview Schedule successfully' }

      else
        format.html {render :new }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def schedulers_params
    params.require(:scheduler).permit(:start_time, :end_time, :interview_date, :candidate_id, :employee_id, :requirement_id)
  end


end
