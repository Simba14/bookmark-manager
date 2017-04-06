require_relative 'web_helpers'

feature 'sign up' do
  scenario 'user signs up for service' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, cheese@gmail.com')
    expect(User.first.email).to eq 'cheese@gmail.com'
  end

  scenario 'user confirms password' do
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :email, with: 'cheese@gmail.com'
    fill_in :password, with: 'brie'
    fill_in :password_confirmation, with: 'brye'
    click_button 'Sign Up Now'
    expect(User.first).to eq nil
  end
end
