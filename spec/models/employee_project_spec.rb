require 'rails_helper'

describe EmployeeProject do
  it { should belong_to(:employee) }
  it { should belong_to(:project) }
  describe ".check" do
    it "should return empty array with length 0 for association that does not exist in employee_projects" do
      expect(EmployeeProject.check(55,55).length).to(eq(0))
    end
  end
end