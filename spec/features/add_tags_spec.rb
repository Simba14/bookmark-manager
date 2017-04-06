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

  scenario 'adding multiple tags to a link' do
    visit '/links/new'
    fill_in(:title, :with => 'Tree')
    fill_in(:url, :with => 'https://www.tree.com/')
    fill_in(:tags, with: 'nature green')

    click_button('Create Link')
    link = Link.first
    expect(link.tags.map(&:name)).to include('nature', 'green')
  end
end
