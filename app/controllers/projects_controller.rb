class ProjectsController < ApplicationController

  def new 
    @project = Project.new
    render :new
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project success!"
      redirect_to projects_path
    else
      flash[:alert] = "There was an error in creating your project."
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    render :edit
  end

  def show
    @project = Project.find(params[:id])
    render :show
  end

  def update
    @employee = Employee.find(params[:employee_id])
    @project = Project.find(params[:id]) ### Need a way to get the project id
    if @project
      # @employee.projects << @project 
      flash[:notice] = "Project assign success!"
      redirect_to projects_path
    else
      flash[:alert] = "There was an error in assigning your project."
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:name)
    end

  end


