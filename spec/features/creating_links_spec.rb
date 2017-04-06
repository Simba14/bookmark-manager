feature 'Creating links' do
  scenario 'form enables user to submit a new link' do
    visit '/links/new'
    fill_in(:title, :with => 'Yahoo')
    fill_in(:url, :with => 'https://uk.yahoo.com/')
    fill_in(:tags, with: 'search')
    click_button('Create Link')

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('https://uk.yahoo.com/')
    end
  end
end
