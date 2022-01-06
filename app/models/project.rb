class Project < ApplicationRecord
  has_many :employee_projects
  has_many :employees, :through => :employee_projects 
  validates :name, presence: true
  before_save(:titleize_project)
  
  private
    def titleize_project
      self.name = self.name.titleize
    end
end
