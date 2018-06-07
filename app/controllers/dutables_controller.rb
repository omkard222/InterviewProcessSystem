class DutablesController < ApplicationController

  def index
    @dutables = Dutable.includes(:projects).all
  end


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

        format.html { redirect_to @dutable,notice: 'Delivery Unit Cell created' }
        format.json { render :show, status: :created, location: @dutable }
      else

        format.html { render :new }
        format.json { render json: @dutable.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    @dutable = Dutable.find(params[:id])
    respond_to do |format|
      if @dutable.update(dutable_params)
        format.html { redirect_to @dutable,notice: 'Updated Successfully' }
      else
        render :edit
      end
    end
  end

  def destroy
    Dutable.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to dutable_url, notice: 'Requirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_project_list
    @dutable = Dutable.find(params[:id])
    respond_to do |format|
      format.js
    end
  end


  def get_project_requirement_details
    @project = Project.find(params[:id])
    @requirements =@project.requirements.order(created_at: :desc)
  end

  def project_list_by_manager
    @project_list = Project.where(user_id: current_user.id)
  end


  private

  def dutable_params
    params.require(:dutable).permit(:du_name, :du_description, projects_attributes: [:id, :project_name,:pro_description,:user_id, :_destroy] )
  end
end
