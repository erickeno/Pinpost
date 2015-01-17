require 'spec_helper'
feature "Creating Pins" do
  before do
    FactoryGirl.create(:board, title: "Food", description: "This is a new board")

    visit '/'
    click_link "Food"
    click_link "New Pin"
   end

  scenario "Creating a pin" do
    fill_in "Name", with: "New pin"
    click_button "Create Pin"

    expect(page).to have_content("Pin has been created.")
  end

  scenario "Creating a pin without valid attributes fails" do
    click_button "Create Pin"
  
    expect(page).to have_content("Pin has not been created.")
    expect(page).to have_content("Name can't be blank")
  end
end
