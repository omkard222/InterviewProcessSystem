class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]

  # GET /candidates
  # GET /candidates.json
  def index
    @requirement = Requirement.find(params[:requirement_id])
    @candidates = @requirement.candidates.eager_load(:requirement)
  end

  def allcandidate
    @candidate = Candidate.all
    @feedback = Feedback.all
  end

  def show

  end

  def new
    @requirement = Requirement.find(params[:requirement_id])
    @candidate = @requirement.candidates.new
  end

  def edit
  end

  def create

    @requirement = Requirement.find(params[:requirement_id])
    @candidate = @requirement.candidates.new(candidate_params)

    respond_to do |format|
        if @candidate.save
          format.html { redirect_to [@requirement,@candidate], notice: 'Candidate was successfully created.' }
          format.json { render :show, status: :created, location: @candidate }
        else
          format.html { render :new }
          format.json { render json: @candidate.errors, status: :unprocessable_entity }
        end
    end
  end

  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to @candidate, notice: 'Candidate was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to candidates_url, notice: 'Candidate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    def candidate_params
      params.require(:candidate).permit(:first_name, :last_name, :contact, :email, :resume, :requirement_id)
    end
end
