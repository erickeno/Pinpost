require 'spec_helper'

feature "Viewing boards" do
  scenario "Listing all boards" do
    board = FactoryGirl.create(:board, title: "Food Board", description: "this is a food board")
    visit '/'
    click_link 'Food Board'
    expect(page.current_url).to eql(board_url(board))
  end
end
