class Employee < ApplicationRecord
  belongs_to :division
  has_many :employee_projects
  has_many :projects, :through => :employee_projects

  def self.arr_emp
    dropdown = []
    self.all.each do |emp|
      dropdown.push([emp.name, emp.id])
    end
    dropdown
  end

end
