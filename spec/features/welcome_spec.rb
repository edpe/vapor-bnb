feature 'Welcome page' do

    scenario 'has a button that redirects to the spaces page' do
      sign_up
      click_button(" s p a c e s ")
      expect(current_path).to eq '/spaces'
    end


end
