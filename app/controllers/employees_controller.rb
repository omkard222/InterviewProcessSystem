class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employee = Employee.all
  end


  def show
    @employee = Employee.find(params[:id])
  end


  def new
    @employee = Employee.new
  end


  def edit
  end


  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to employees_url,  notice: 'Employee Created   successfully'}
      else
        render 'new'
      end
    end
  end


  def update
    @employee.employee_requirement_skills.build(skill_id: params[:employee][:skill_id])
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @respond_to, notice: 'Employee Details Updated succesfully' }

      else
        format.html { render :edit }

      end
    end
  end


  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee deleted' }
      format.json { head :no_content }
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end


  def employee_params
    params.require(:employee).permit(:emp_firstname, :emp_lastname, :emp_id, :emp_designation, :emp_skills, :emp_mail, :emp_phone,:skill_id)
  end
end
