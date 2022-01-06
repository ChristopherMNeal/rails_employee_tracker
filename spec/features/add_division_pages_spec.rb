require 'rails_helper'

describe "the add an division process" do
  it "adds a new division" do
    visit divisions_path
    click_link 'Add a division'
    fill_in 'Name', :with => 'Human Resources'
    click_on 'Create Division'
    expect(page).to have_content 'Division success!'
    expect(page).to have_content 'Human Resources'
  end

  it "gives an error when no name is entered" do
    visit new_division_path
    click_on 'Create Division'
    expect(page).to have_content "Name can't be blank"
  end
end
