require 'rails_helper'

describe "the edit an employee process" do
  before :each do
    visit divisions_path
    click_link 'Add a division'
    fill_in 'Name', :with => 'Human Resources'
    click_on 'Create Division'
    click_link 'Human Resources'
    click_link 'Add a employee'
    fill_in 'Name', :with => 'Todd Bonzales'
    click_on 'Create Employee'
  end

  it "edits an employee" do
    click_link 'Todd Bonzales'
    click_link 'Edit'
    fill_in 'Name', :with => 'Todo Bonezales'
    click_on 'Update Employee'
    expect(page).to have_content 'Employee successfully updated!'
    expect(page).to have_content 'Todo Bonezales'
    expect(page).to have_no_content 'Todd Bonzales'
  end
end