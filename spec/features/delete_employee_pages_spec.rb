require 'rails_helper'

describe "the delete a division process" do
  it "deletes a division" do
    visit divisions_path
    click_link 'Add a division'
    fill_in 'Name', :with => 'Human Resources'
    click_on 'Create Division'
    click_link 'Human Resources'
    click_link 'Add a employee'
    fill_in 'Name', :with => 'Todd Bonzales'
    click_on 'Create Employee'
    click_on 'Todd Bonzales'
    click_on 'Delete employee'
    expect(page).to have_no_content 'Todd Bonzales'
  end
    
end
