require 'rails_helper'

describe "the add an employee process" do
  it "adds a new employee" do
    visit divisions_path
    click_link 'Add a division'
    fill_in 'Name', :with => 'Human Resources'
    click_on 'Create Division'
    click_link 'Human Resources'
    click_link 'Add a employee'
    fill_in 'Name', :with => 'Todd Bonzales'
    click_on 'Create Employee'
    expect(page).to have_content 'Employee successfully added!'
    expect(page).to have_content 'Human Resources'
  end

  ### CAN WE MAKE THIS WORK WITHOUT MAKING A NEW DIVISION FIRST?
  it "gives an error when no name is entered" do
    visit new_division_employee_path # missing required keys: [:division_id]
    click_on 'Create Employee'
    expect(page).to have_content "Name can't be blank"
  end
end
