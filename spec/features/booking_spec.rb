feature 'creating a booking' do
  scenario 'adds a booking to the database' do
    sign_up
    space_form
    click_button (' v i e w ')
    fill_in('date', with: '08/02/2017')
    click_button (' b o o k ')
    expect(Booking.all.count).to eq 1
  end

    scenario 'adds space name to a booking' do
      sign_up
      space_form
      click_button (' v i e w ')
      fill_in('date', with: '08/02/2017')
      click_button (' b o o k ')
      expect(Booking.first.space.name).to eq 'Holo Pad'
    end

    scenario 'new bookings are uncomfirmed' do
      sign_up
      space_form
      click_button (' v i e w ')
      fill_in('date', with: '08/02/2017')
      click_button (' b o o k ')
      expect(Booking.first.confirmed).to eq false
    end

    scenario 'bookings can be confirmed' do
      sign_up
      space_form
      click_button (' v i e w ')
      fill_in('date', with: '08/02/2017')
      click_button (' b o o k ')
      Booking.first.confirm
      expect(Booking.first.confirmed).to eq true
    end

end
