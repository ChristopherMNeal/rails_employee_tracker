class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    render :index
  end
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


  def show
    @project = Project.find(params[:id])
    render :show
  end

  def edit
    @project = Project.find(params[:id])
    render :edit
  end

#project_employee_ids

  def update
    emp_id = params[:project]
    @employee = Employee.find(emp_id[:employee_ids])
    @project = Project.find(params[:id])
    if EmployeeProject.check(emp_id[:employee_ids],params[:id]).length == 0
      @project.employees << @employee
      flash[:notice] = "Project assign success!"
      p "Added employee to project"
      redirect_to project_path
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
      params.require(:project).permit(:id, :name, employee_ids:[])
    end
  end


