class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      flash[:success] = "Project was initialized successfully"
      redirect_to projects_path
    else
      flash[:danger] = "Project initializing failed"
      render :new
    end
  end

  def update
    if @project.update_attributes project_params
      flash[:success] = "Project was updated successfully"
      redirect_to projects_path
    else
      flash[:danger] = "Project updating failed"
      render :edit
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :user_id, :start)
    end
end
