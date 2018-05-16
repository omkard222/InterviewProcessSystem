class FeedbacksController < ApplicationController

  def index
    @scheduler = Requirement.find(params[:scheduler_id])
    @feedbacks = @scheduler.feedbacks
  end

  def get_feedback
    @feed = Feedback.where(candidate_id: params[:candidate_id])
    @sch = Scheduler.all
  end

  def new
    @scheduler = Scheduler.find(params[:scheduler_id])
    @feedback = @scheduler.feedbacks.new
  end

  def create
    @scheduler = Scheduler.find(params[:scheduler_id])
    @feedback = @scheduler.feedbacks.new(feedback_params)
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to schedulers_path, notice: 'Feedback was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @feedback = Feedback.find(params[:id])
  end



  private
  
  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def feedback_params
    params.require(:feedback).permit(:scheduler_id, :candidate_id, :stage_name, :status, :round_type,:duration_of_interview,:comments, :communication, :attitude, :learning_capabilties, :Tech_analysis)
  end
end
