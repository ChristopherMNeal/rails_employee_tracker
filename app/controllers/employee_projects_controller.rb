class EmployeeProjectsController < ApplicationController
  def show
    @employee_project = EmployeeProject.find(params[:id])
    @employee = Employee.find(@employee_project.employee_id)
    @project = Project.find(@employee_project.project_id)
    render :show
  end

  def edit
    @employee_project = EmployeeProject.find(params[:id])
    @employee = Employee.find(@employee_project.employee_id)
    @project = Project.find(@employee_project.project_id)
    render :edit
  end

  def destroy
    employee_project = EmployeeProject.find(params[:id])
    employee_project.destroy
    redirect_to projects_path
  end
end