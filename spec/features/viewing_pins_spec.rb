require 'spec_helper'

feature "Viewing pins" do
  before do
    food_board = FactoryGirl.create(:board, title: "Food board", description: "This is a food board")

    FactoryGirl.create(:pin, board: food_board, name: "food pin")

    cars_board = FactoryGirl.create(:board, title: "Car board", description: "This is a car board")

    FactoryGirl.create(:pin, name:"Car pin", board: cars_board)

    visit '/'
  end

  scenario "Viewing pins for a given board" do
    click_link "Food board"

    expect(page).to have_content("food pin")

    click_link "food pin"
    within("#pin h2") do
      expect(page).to have_content("food pin")
    end
  end
end
