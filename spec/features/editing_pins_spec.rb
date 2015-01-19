require 'spec_helper'

feature "Editing pins" do
  let!(:board) { FactoryGirl.create(:board) }
  let!(:pin)   { FactoryGirl.create(:pin, board: board)  }

  before do
    visit '/'
    click_link board.title
    click_link pin.name
    click_link "Edit Pin"
  end

  scenario "Updating a pin" do
    fill_in "Name", with: "new name for pin"
    click_button "Update Pin"

    expect(page).to have_content("Pin has been updated")

    within("#pin h2") do
      expect(page).to have_content("new name for pin")
    end

    expect(page).to_not have_content pin.name
  end
  
  scenario "Updating a pin with invalid infomation" do
    fill_in "Name", with: ""
    click_button "Update Pin"

    expect(page).to have_content("Pin has not been updated.")
  end
end
