
feature 'view links' do
  before(:each) do
    Link.create(url: 'http://www.bbc.co.uk', title: 'BBC', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.plastic.com', title: 'Plastics', tags: [Tag.first_or_create(name: 'materials')])
    Link.create(url: 'http://www.music.com', title: 'Music and Stuff', tags: [Tag.first_or_create(name: 'music')])
    Link.create(url: 'http://www.music.com', title: 'Mountains', tags: [Tag.first_or_create(name: 'nature')])
  end


  scenario 'see links on homepage' do
    #binding.pry
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
     expect(page).to have_content('Plastics')
    end
  end


  scenario 'user can filter links by tag' do
    visit '/tags/nature' do
      expect(page).not_to have_content('BBC')
      expect(page).not_to have_content('Plastics')
      expect(page).not_to have_content('Music and Stuff')
      expect(page).to have_content('Mountains')
    end
  end
end
