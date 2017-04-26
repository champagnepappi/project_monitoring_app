class ProjectsController < ApplicationController
  before_action :logged_in_user

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

  def show
    @project = Project.find_by(id: params[:id])
  end

  def approve
    project = Project.find_by(id: params[:id])
    if project.update_attribute(:status, params[:status])
      @user = User.find(project.user_id)
      UserMailer.project_approval(@user).deliver
      redirect_to projects_path
    end
  end

  def reject
    project = Project.find_by(id: params[:id])
    if project.update_attribute(:status, params[:status])
      @user = User.find(project.user_id)
      UserMailer.project_rejection(@user).deliver
      redirect_to projects_path
    end
  end

  def undo_approval
    project = Project.find_by(id: params[:id])
    project.update_attribute(:status, params[:status])
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
