feature 'Add tags' do
  scenario 'Allows a user to add tags to a link' do
    visit '/links/new'
    fill_in(:title, :with => 'Yahoo')
    fill_in(:url, :with => 'https://uk.yahoo.com/')
    fill_in(:tags, with: 'search')

    click_button('Create Link')
    link = Link.first
      expect(link.tags.map(&:name)).to include('search')
  end


  scenario 'Allows a user to add multiple tags to a link' do
    visit '/links/new'
    fill_in(:url, :with => 'https://uk.yahoo.com')
    fill_in(:title, :with => 'Yahoo')
    fill_in(:tags, with: 'search tech')
    click_button 'Create Link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('search', 'tech')
  end
end
