class SchedulersController < ApplicationController
  def index
    @schedulers = Scheduler.all
  end
  def new
    @requirement = Requirement.find(params[:requirement_id])
    @candidate = Candidate.find(params[:candidate_id])
    @scheduler = @candidate.schedulers.build

  end


  def show
    @scheduler= Scheduler.find(params[:id])
  end

  def create
    @requirement = Requirement.find(params[:requirement_id])
    @candidate = Candidate.find(params[:candidate_id])
    @scheduler =  @candidate.schedulers.new(schedulers_params)
    @scheduler.requirement_id = params[:requirement_id]
    @alreadyschedule = Scheduler.all

    @alreadyschedule.each do |a|

    respond_to do |format|
      if @scheduler.candidate_id == a.candidate_id
          format.html {redirect_to @scheduler, notice: 'Already Interview Schedule' }

      else
        @scheduler.save
        InterviewInfoMailer.candidate_information(@scheduler).deliver
        format.html {render 'show', notice: 'Interview schedule' }
      end
        end

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

  # Never trust parameters from the scary internet, only allow the white list through.
  def schedulers_params
    params.require(:scheduler).permit(:start_time, :end_time, :interview_date, :candidate_id, :employee_id, :requirement_id)
  end


end
