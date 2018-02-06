feature 'User accounts' do

  context 'Sign up' do
    scenario 'creates a user account in the db' do
      sign_up
      expect(User.all.count).to eq 1
    end

    scenario 'shows the user\'s name on the welcome page' do
      # This test is here to assert that the user id is stored in a session
      sign_up
      expect(page).to have_content('Welcome, Test Bloggs!')
    end

    scenario 'encrypts the user\'s password' do
      sign_up
      expect(User.first.password_hash).not_to eq('testing123')
    end
  end

end
