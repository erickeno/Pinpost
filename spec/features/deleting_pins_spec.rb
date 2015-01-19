require 'spec_helper'

feature "Deleting Pins" do
  let!(:board) { FactoryGirl.create(:board) }
  let!(:pin) { FactoryGirl.create(:pin, board: board) }

  before do
    visit '/'
    click_link board.title
    click_link pin.name
  end

  scenario "Deleting a pin" do
    click_link "Delete Pin"

    expect(page).to have_content("Pin has been deleted.")
    expect(page.current_url).to eq(board_url(board))
  end
end
