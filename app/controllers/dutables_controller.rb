class DutablesController < ApplicationController
  before_action :set_dutable, only: [:show, :edit, :update, :destroy]

  # GET /requirements
  # GET /requirements.json
  def index
    @dutables = Dutable.all
  end

  # GET /requirements/1
  # GET /requirements/1.json
  def show

    @dutable = Dutable.find(params[:id])
  end

  # GET /requirements/new
  def new
    @dutable = Dutable.new
    @project = @dutable.projects.build
    

  end

  # GET /requirements/1/edit
  def edit
  end

  # POST /requirements
  # POST /requirements.json
  def create
    @dutable = Dutable.new(dutable_params)
    respond_to do |format|
      if @dutable.save

        format.html { redirect_to @dutable}
        format.json { render :show, status: :created, location: @dutable }
      else

        format.html { render :new }
        format.json { render json: @dutable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requirements/1
  # PATCH/PUT /requirements/1.json


  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @dutable.destroy
    respond_to do |format|
      format.html { redirect_to dutable_url, notice: 'Requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dutable
      @dutable = Dutable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dutable_params
      params.require(:dutable).permit(:du_name, :du_id_code, :du_description, projects_attributes: [:id, :project_name, :pro_idcode, :pro_description, :_destroy] )
    end
end
