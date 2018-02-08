feature 'Welcome page' do

  context 'has content' do

    scenario '"as a customer"' do
      sign_up
      expect(page).to have_content("As a customer")
    end

    scenario '"as a land baron"' do
      sign_up
      expect(page).to have_content("As a land baron")
    end

  end

  context 'has a button that redirects to' do

    scenario 'the spaces page' do
      sign_up
      click_button("☯ s p a c e s ☯")
      expect(current_path).to eq '/spaces'
    end

    scenario 'the customer\'s bookings page' do
      sign_up
      click_button("Δ b o o k i n g s Δ")
      expect(current_path).to eq '/customer/bookings'
    end

    scenario 'the land baron\'s space management page' do
      sign_up
      click_button("♛ m a n a g e _ s p a c e s ♛")
      expect(current_path).to eq '/host/space_management'
    end

    scenario 'the land baron\'s bookings management page' do
      sign_up
      click_button("▩ m a n a g e _ b o o k i n g s ▩")
      expect(current_path).to eq '/host/bookings_management'
    end

  end


end
