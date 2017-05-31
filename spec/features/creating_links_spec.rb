# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager

feature 'save a website to my list' do
  scenario 'add the site address and title' do
    visit('/links')
    click_button('Add link')
    fill_in('title', with: 'BBC')
    fill_in('url', with: 'http://www.bbc.com')
    click_button('Create link')
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end
end
