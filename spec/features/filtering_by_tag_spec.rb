feature 'Filter by tags' do
  scenario 'user can filter links by searching for tag' do
    Link.create(url: 'http://www.bubblesandfun.com', title: 'Bubbles & Fun', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bbc.com', title: 'BBC', tags: [Tag.first_or_create(name: 'news')])
    visit '/tags/bubbles'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Bubbles & Fun')
      expect(page).not_to have_content('BBC')
    end
  end
end
