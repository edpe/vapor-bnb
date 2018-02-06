feature 'User accounts' do

  context 'Sign up' do
    scenario 'creates a user account' do
      visit('/')
      fill_in('name', with: 'Test Bloggs')
      fill_in('username', with: 'tester')
      fill_in('email', with: 'test@test.co.uk')
      fill_in('password', with: 'testing123')
      click_button("Submit")
      expect(User.all.count).to eq 1
    end
  end

end
