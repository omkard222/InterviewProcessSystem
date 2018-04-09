class DutablesController < ApplicationController


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


  def new
    @dutable = Dutable.new
    @project = @dutable.projects.build


  end


  def edit
    @dutable = Dutable.find(params[:id])
  end


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

  def update

      if @dutable.update(dutable_params)
      redirect_to @dutable

      else
        render :edit

      end
    
  end


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

    def dutable_params
      params.require(:dutable).permit(:du_name, :du_id_code, :du_description, projects_attributes: [:id, :project_name, :pro_idcode, :pro_description, :_destroy] )
    end
end
