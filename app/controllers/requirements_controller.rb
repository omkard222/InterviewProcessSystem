class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy, :get_candidate_list]
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
  Rails.logger.debug "Access Denied: #{exception.message}"
  flash[:alert] = exception.message
  redirect_to root_url
  end

  def index
    @requirements = Requirement.order(created_at: :desc)
  end


  def show
    @requirement = Requirement.find(params[:id])
  end


  def new
    @project = Project.find(params[:project_id])
    @requirement = @project.requirements.build
  end


  def edit
      @requirement = Requirement.find(params[:id])
  end


  def create
    @requirement = Requirement.new(requirement_params)
    respond_to do |format|
      if @requirement.save
        format.html { redirect_to @requirement, notice: 'Requirement was successfully created.' }
        format.json { render :show, status: :created, location: @requirement }
      else
        format.html { render :new }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @requirement.update(requirement_params)
        format.html { redirect_to [@requirement, @project] , notice: 'Requirement was successfully updated.' }
        format.json { render :show, status: :ok, location: @requirement }
      else
        format.html { render :edit }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @requirement.destroy
    respond_to do |format|
      format.html { redirect_to requirements_url, notice: 'Requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def get_candidate_list
    @candidates = @requirement.candidates.order(created_at: :desc)
      respond_to do |format|
      format.js
    end
  end




  private

    def set_requirement
      @requirement = Requirement.find(params[:id])
    end


    def requirement_params
      params.require(:requirement).permit(:status,:position, :skills, :experience,:qualification, :opportunityID, :skill_id, :project_id, :job_description, :job_summary)
    end
end
