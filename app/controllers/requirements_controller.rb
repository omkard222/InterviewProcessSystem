class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]

  # GET /requirements
  # GET /requirements.json
  def index

    @requirements = Requirement.all
  end

  # GET /requirements/1
  # GET /requirements/1.json
  def show
    @requirement = Requirement.find(params[:id])
  end

  # GET /requirements/new
  def new
    @project = Project.find(params[:project_id])
    @requirement = @project.requirements.build

  end

  # GET /requirements/1/edit
  def edit
  end

  # POST /requirements
  # POST /requirements.json
  def create
    # @project = Project.find(params[:project_id])
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

  # PATCH/PUT /requirements/1
  # PATCH/PUT /requirements/1.json
  def update
    @requirement.employee_requirement_skills.build(skill_id: params[:requirement][:skill_id])
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

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @requirement.destroy
    respond_to do |format|
      format.html { redirect_to requirements_url, notice: 'Requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requirement
      @requirement = Requirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requirement_params

      params.require(:requirement).permit(:position, :skills, :experience,:qualification, :opportunityID, :skill_id, :project_id, :job_description, :job_summary)

       params.require(:requirement).permit(:position, :skills, :experience,:qualification, :opportunityID, :skill_id, :project_id, :job_description, :job_summary)

    end
end
