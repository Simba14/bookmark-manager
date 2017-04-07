require_relative 'web_helpers'

feature 'sign up' do
  scenario 'user signs up for service' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, cheese@gmail.com')
    expect(User.first.email).to eq 'cheese@gmail.com'
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  def sign_up(email: 'cheese@gmail.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up Now'
  end

end
