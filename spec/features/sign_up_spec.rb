require_relative 'web_helpers'

feature 'sign up' do
  scenario 'user signs up for service' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, cheese@gmail.com')
    expect(User.first.email).to eq 'cheese@gmail.com'
  end
end
