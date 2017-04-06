feature 'sign up' do
  scenario 'user signs up for service' do
    visit '/sign-up'
    fill_in(:email, with: 'cheese@gmail.com')
    fill_in(:password, with: 'brie')
    click_button('Sign Up Now')

    expect(current_path).to eq '/links'
    expect(page).to have_content('Welcome')

    within '#welcome' do
      expect(page).to have_content('cheese@gmail.com')
    end

  end
end
