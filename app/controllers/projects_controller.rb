class ProjectsController < ApplicationController

  def show

    @project = Project.find(params[:id])
    @requirement = Requirement.new
  end

end
