# As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag
feature 'Filtering by tags' do
  scenario 'allows to filter links by tags' do

    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.bbc.com', title: 'BBC', tags: [Tag.first_or_create(name: 'news')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.amazom.co.uk', title: 'Amazon', tags: [Tag.first_or_create(name: 'shopping')])
    Link.create(url: 'http://www.bubble-bubble.com', title: 'Bubble Bubble', tags: [Tag.first_or_create(name: 'bubbles')])

    visit('/tags/bubbles')
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('BBC')
      expect(page).not_to have_content('Amazon')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bubble')
    end

  end

end
