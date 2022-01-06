require 'rails_helper'

describe Project do
  it { should have_many(:employees).through(:employee_projects)}
  describe "#titleize_project" do
    it "will capitalize first letter of ever project" do
      project = Project.create({name: "giant steps"})
      expect(project.name()).to(eq("Giant Steps"))
    end
  end
  it { should validate_presence_of :name }
end