# As a time-pressed user
# So that I can organise my many links into different categories for ease of search
# I would like to tag links in my bookmark manager
feature 'Adding tags' do

  scenario 'allow to add a tag to a new link' do
    visit '/links/new'
    fill_in('title', with: 'Amazon')
    fill_in('url', with: 'http://www.amazon.co.uk')
    fill_in('tags', with: 'shopping')
    click_button('Create link')
    link = Link.first
    p __FILE__,__LINE__, link
    expect(link.tags.map(&:name)).to include('shopping')
  end

  scenario 'I can add multiple tags to a new link' do
    visit '/links/new'
    fill_in('title', with: 'Makers Academy')
    fill_in('url',   with: 'http://www.makersacademy.com/')
    # our tags will be space separated
    fill_in('tags',  with: 'education ruby')
    click_button('Create link')
    link = Link.first
    p __FILE__,__LINE__, link
    expect(link.tags.map(&:name)).to include('education', 'ruby')
  end


end
