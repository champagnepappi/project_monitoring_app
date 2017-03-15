class ProjectsController < ApplicationController

  def index
    @submitted = Project.submitted
    @approved  = Project.approved
    @rejected  = Project.rejected
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to current_user
      flash[:success] = "Project successfully submitted"
    else
      render 'new'
      flash[:alert] = "There was a problem submitting your project"
    end
  end

  private
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
