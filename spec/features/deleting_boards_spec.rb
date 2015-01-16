require 'spec_helper'

feature "Deleting boards" do
  scenario "Deleting a board" do
    FactoryGirl.create(:board, title:"Food", description:"Food board")

    visit '/'
    click_link "Food"
    click_link "Delete Board"

    expect(page).to have_content("Board has been destroyed.")

    visit '/'

    expect(page).to have_no_content("Food")
  end
end
