feature 'creating a booking' do
  scenario 'adds a booking to the database' do
    sign_up
    space_form
    visit('/bookings/new')
    fill_in('space_name', with: 'Holo Pad')
    fill_in('date', with: '08/02/2017')
    click_button('Submit')
    expect(Booking.all.count).to eq 1
  end

    scenario 'adds space name to a booking' do
      sign_up
      space_form
      visit('/bookings/new')
      fill_in('space_name', with: 'Holo Pad')
      fill_in('date', with: '08/02/2017')
      click_button('Submit')
      expect(Booking.first.space.name).to eq 'Holo Pad'
    end
end
