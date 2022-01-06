require 'rails_helper'

describe "the add a project process" do
  it "adds a new project" do
    visit projects_path
    click_link 'Add a project'
    fill_in 'Name', :with => 'Rails Employee Tracker'
    click_on 'Create Project'
    expect(page).to have_content 'Project success!'
    expect(page).to have_content 'Rails Employee Tracker'
  end

  it "gives an error when no name is entered" do
    visit new_project_path
    click_on 'Create Project'
    expect(page).to have_content "Name can't be blank"
  end
end
