require 'rails_helper'

describe "the edit a division process" do
  it "edits a division" do
    visit divisions_path
    click_link 'Add a division'
    fill_in 'Name', :with => 'Human Resources'
    click_on 'Create Division'
    click_link 'Human Resources'
    click_link 'Edit'
    fill_in 'Name', :with => 'Not HR'
    click_on 'Update Division'
    expect(page).to have_content 'Not HR'
  end
end
