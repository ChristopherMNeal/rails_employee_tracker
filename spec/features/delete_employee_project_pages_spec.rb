require 'rails_helper'

describe "the edit a employee_project process" do
  it "removes association" do
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
    click_on 'Edit association'
    click_on 'Remove employee from project'
    click_link 'Capybara'
    expect(page).to have_no_content('Todd Bonzales')
  end
end