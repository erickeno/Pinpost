require 'spec_helper'

feature 'Creating Boards' do
  before do
    visit '/'
    click_link 'New Board'
  end
  scenario "can create a project" do

    fill_in 'Title', with: 'Food'
    fill_in 'Description', with: 'This is a food board'

    click_button 'Create Board'

    expect(page).to have_content('Board has been created')
  end
  
  scenario "can not create a board without a title" do
    click_button 'Create Board'

    expect(page).to have_content("Board has not been created.")
    expect(page).to have_content("Title can't be blank")
  end
  
  scenario "cannot create a board without a description" do
    click_button 'Create Board'

    expect(page).to have_content("Board has not been created.")
    expect(page).to have_content("Description can't be blank")
  end
end
