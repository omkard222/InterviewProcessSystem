class FeedbacksController < ApplicationController
  def index
  end
  def new
      @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
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
      params.require(:feedback).permit(:stage_name, :status, :duration_of_interview,:comments, :communication, :attitude, :learning_capabilties, :Tech_analysis)
    end
end
