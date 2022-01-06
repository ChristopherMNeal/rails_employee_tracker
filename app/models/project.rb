class Project < ApplicationRecord
  has_many :employee_projects
  has_many :employees, :through => :employee_projects
  scope :search, -> (name_parameter) { where(name: name_parameter) } 

  before_save(:titleize_project)

  private
    def titleize_project
      self.name = self.name.titleize
    end
end
