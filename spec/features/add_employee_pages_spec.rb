require 'rails_helper'

describe "the add an employee process" do
  before :each do
    visit divisions_path
    click_link 'Add a division'
    fill_in 'Name', :with => 'Human Resources'
    click_on 'Create Division'
  end

  it "adds a new employee" do
    click_link 'Human Resources'
    click_link 'Add a employee'
    fill_in 'Name', :with => 'Todd Bonzales'
    click_on 'Create Employee'
    expect(page).to have_content 'Employee successfully added!'
    expect(page).to have_content 'Human Resources'
  end

  it "gives an error when no name is entered" do
    visit new_division_path
    fill_in 'Name', :with => 'New Division'
    click_on 'Create Division'
    click_link 'New Division'
    click_link 'Add a employee'
    click_on 'Create Employee'
    expect(page).to have_content "Name can't be blank"
  end
end
