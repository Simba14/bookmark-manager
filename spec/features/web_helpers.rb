def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: 'cheese@gmail.com'
  fill_in :password, with: 'brie'
  click_button 'Sign Up Now'
end
