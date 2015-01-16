require 'spec_helper'

feature "Editing Boards" do
  before do
    FactoryGirl.create(:board, title: "Food Board", description: "This is a food board")
    visit '/'
    click_link "Food Board"
    click_link "Edit Board"
  end
  scenario "Updating a board" do
    fill_in "Title", with: "Food Board beta"
    click_button "Update Board"

    expect(page).to have_content("Board has been updated.")
  end

  scenario "Updating a board with invalid attributes is bad" do
    fill_in "Title", with: ""
    click_button "Update Board"

    expect(page).to have_content("Board has not been updated.")
  end
end
