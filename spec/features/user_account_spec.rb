feature 'User accounts' do
  # delete this comment

  context 'Sign up' do

    context 'successfully' do

      scenario 'creates a user account in the db' do
        sign_up
        expect(User.all.count).to eq 1
      end

      scenario 'shows the user\'s name on the welcome page' do
        sign_up
        expect(page).to have_content('Welcome, Test Bloggs!')
      end

      scenario 'encrypts the user\'s password' do
        sign_up
        expect(User.first.password_hash).not_to eq('testing123')
      end

    end

    context 'database is unchanged if' do

      scenario 'password and password_confirmation do not match' do
        expect{ sign_up('Test Bloggs', 'tester', 'test@test.co.uk', 'testing123', 'thisiswrong') }.to_not change{ User.all.count }
      end

      scenario 'non-unique email is provided' do
        sign_up
        expect{ sign_up('Different Bloggs', 'tester2', 'test@test.co.uk', 'testing123') }.to_not change{ User.all.count }
      end

      scenario 'non-unique username is provided' do
        sign_up
        expect{ sign_up('Different Bloggs', 'tester', 'test1@test.co.uk') }.to_not change{ User.all.count }
      end

      scenario 'no name is provided' do
        User.create(username: 'tester', email: 'test@test.co.uk', password: 'test123', password_confirmation: 'test123')
        expect(User.all.count).to eq 0
      end

      scenario 'no username is provided' do
        User.create(name: 'Test Bloggs', email: 'test@test.co.uk', password: 'test123', password_confirmation: 'test123')
        expect(User.all.count).to eq 0
      end

      scenario 'no email is provided' do
        User.create(name: 'Test Bloggs', username: 'tester', password: 'test123', password_confirmation: 'test123')
        expect(User.all.count).to eq 0
      end

      scenario 'no password hash is provided' do
        User.create(name: 'Test Bloggs', username: 'tester', email: 'test@test.co.uk')
        expect(User.all.count).to eq 0
      end

      scenario 'email is provided with incorrect format' do
        User.create(name: 'Test Bloggs', email: 'invalidemail', username: 'tester', password: 'test123', password_confirmation: 'test123')
        expect(User.all.count).to eq 0
      end

    end

    context 'displays error if' do

      scenario 'no email is provided on sign up' do
        sign_up("Test Bloggs", "Tester", nil)
        expect(page).to have_content("Email must not be blank")
      end

      scenario 'no username is provided on sign up' do
        sign_up("Test Bloggs", nil)
        expect(page).to have_content("Username must not be blank")
      end

      scenario 'no name is provided on sign up' do
        sign_up(nil)
        expect(page).to have_content("Name must not be blank")
      end

      scenario 'passwords don\'t match' do
        sign_up('Test Bloggs', 'tester', 'test@test.co.uk', 'testing123', 'thisiswrong')
        expect(page).to have_content("Password does not match the confirmation")
      end

      scenario 'email is in an incorrect format' do
        sign_up('Test Bloggs', 'tester', "testytest")
        expect(page).to have_content("Email has an invalid format")
      end

    end

  end

end
