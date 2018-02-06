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

    scenario 'fails if password and password_confirmation do not match' do
      expect{ sign_up('Test Bloggs', 'tester', 'test@test.co.uk', 'testing123', 'thisiswrong') }.to_not change{ User.all.count }
    end

    scenario 'fails if non-unique email is provided' do
      sign_up()
      expect{ sign_up('Different Bloggs', 'tester2', 'test@test.co.uk', 'testing123') }.to_not change{ User.all.count }
    end
  end

end
