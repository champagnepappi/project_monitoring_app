class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
  end

  private
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
