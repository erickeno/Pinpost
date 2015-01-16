require 'spec_helper'

feature 'Creating Boards' do
  scenario "can create a project" do
    visit '/'

    click_link 'New Board'

    fill_in 'Title', with: 'Food'
    fill_in 'Description', with: 'This is a food board'

    click_button 'Create Board'

    expect(page).to have_content('Board has been created')
  end
end
