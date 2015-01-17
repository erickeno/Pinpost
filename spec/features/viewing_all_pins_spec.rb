require 'spec_helper'

feature "View all the pins" do
  scenario "Listing all the pins" do
    board = FactoryGirl.create(:board, title:"Food Board", description: "This is a food board")
    board_2 = FactoryGirl.create(:board, title: "Car Board", description: "This is a car board")
    FactoryGirl.create(:pin, board: board, name: "food pin")
    FactoryGirl.create(:pin, board: board_2, name: "car pin")


    visit '/'
    click_link "Pins"

    expect(page).to have_content("food pin")
    expect(page).to have_content("car pin")
  end
  scenario "Display message if no pins" do
    visit '/'
    click_link "Pins"

    expect(page).to have_content("Currently no pins available")
  end
end
