# As a user
# So I can easily select a link
# I want to view a list of links on my homepage

feature 'Can view links on homepage' do
  scenario 'When I open the homepage I can see a list of links' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/links')
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
