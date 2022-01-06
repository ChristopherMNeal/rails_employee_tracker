class EmployeeProject < ApplicationRecord
  belongs_to :employee
  belongs_to :project
  scope :check, -> (emp_id,proj_id) { where(project_id: proj_id, employee_id: emp_id) }
end