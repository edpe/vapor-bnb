def sign_up(name = 'Test Bloggs', username = 'tester', email = 'test@test.co.uk', password = 'testing123', password_confirmation = password)
  visit('/')
  fill_in('name', with: name)
  fill_in('username', with: username)
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button("Submit")
end
