require 'rails_helper'

describe "the delete a division process" do
  it "deletes a division" do
    visit divisions_path
    click_link 'Add a division'
    fill_in 'Name', :with => 'Human Resources'
    click_on 'Create Division'
    click_on 'Human Resources'
    click_on 'Delete division'
    
    expect(page).to have_no_content 'Human Resources'
  end

end
