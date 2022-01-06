require 'rails_helper'

describe Employee do
  it { should belong_to(:division)}
  it { should have_many(:projects).through(:employee_projects)}
  it { should validate_presence_of :name }
end
