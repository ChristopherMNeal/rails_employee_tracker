require 'rails_helper'

describe "the add a project process" do
  it "adds a new project" do
    visit projects_path
    click_link 'Add a project'
    fill_in 'Name', :with => 'Rails Employee Tracker'
    click_on 'Create Project'
    expect(page).to have_content 'Project success!'
    click_on 'Rails Employee Tracker'
    click_on 'Delete project'
    expect(page).to have_no_content 'Rails Employee Tracker'
  end

 
end
