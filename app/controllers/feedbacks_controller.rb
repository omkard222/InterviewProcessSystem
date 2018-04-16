class FeedbacksController < ApplicationController
  def index
    @scheduler = Requirement.find(params[:scheduler_id])
    @feedbacks = @scheduler.feedbacks
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
        format.html { redirect_to [@scheduler, @feedback], notice: 'Feedback was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  def show

    @feedback = Feedback.find(params[:id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:scheduler_id, :stage_name, :status, :duration_of_interview,:comments, :communication, :attitude, :learning_capabilties, :Tech_analysis)
    end
end
