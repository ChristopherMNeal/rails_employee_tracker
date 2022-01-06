require 'rails_helper'

describe "the edit a project process" do
  it "edits a project" do
    visit divisions_path
    click_link 'Add a division'
    fill_in 'Name', :with => 'Human Resources'
    click_on 'Create Division'
    click_link 'Human Resources'
    click_link 'Add a employee'
    fill_in 'Name', :with => 'Todd Bonzales'
    click_on 'Create Employee'
    visit projects_path
    click_link 'Add a project'
    fill_in 'Name', :with => 'Capybara'
    click_on 'Create Project'
    click_link 'Capybara'
    click_link 'Edit'
    select 'Todd Bonzales', :from => 'project[employee_ids]'
    click_on 'Update Project'
    expect(page).to have_content 'Todd Bonzales'
  end
  
  it "gives a success message when no name is entered" do
    visit divisions_path
    click_link 'Add a division'
    fill_in 'Name', :with => 'Human Resources'
    click_on 'Create Division'
    click_link 'Human Resources'
    click_link 'Add a employee'
    fill_in 'Name', :with => 'Todd Bonzales'
    click_on 'Create Employee'
    visit projects_path
    click_link 'Add a project'
    fill_in 'Name', :with => 'Capybara'
    click_on 'Create Project'
    click_on 'Capybara'
    click_on 'Edit'
    select 'Todd Bonzales', :from => 'project[employee_ids]'
    click_on 'Update Project'

    expect(page).to have_content "Project assign success!"
  end
  
end