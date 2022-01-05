class EmployeesController < ApplicationController
  def new
    @division = Division.find(params[:division_id])
    @employee = @division.employees.new
    render :new
  end

  def create
    @division = Division.find(params[:division_id])
    @employee = @division.employees.new(employee_params)
    if @employee.save
      flash[:notice] = "Employee successfully added!"
      redirect_to division_path(@division)
    else
      flash[:alert] = "There was an error in creating your employee!"
      render :new
    end
  end

  def show
    @division = Division.find(params[:division_id])
    @employee = Employee.find(params[:id])
    render :show
  end

  def edit
    @division = Division.find(params[:division_id])
    @employee = Employee.find(params[:id])
    render :edit
  end

  def update
    @employee = Employee.find(params[:id])
    select_project=Project.name("lets get jiggy wit it")
    
    if @employee.update(employee_params)
      flash[:notice] = "Employee successfully updated!"
      redirect_to division_path(@employee.division)
    else
      flash[:alert] = "There was an error in updating your employee!"
      @division = Division.find(params[:division_id])
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to division_path(@employee.division)
  end

  private
    def employee_params
      params.require(:employee).permit(:name)
    end
end