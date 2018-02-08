feature 'confirming a booking' do

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

  scenario 'booking is shown on management page' do
    sign_up
    space_form
    click_button (' v i e w ')
    fill_in('date', with: '08/02/2017')
    click_button (' b o o k ')
    visit('/welcome')
    click_button ("▩ m a n a g e _ b o o k i n g s ▩")
    expect(page).to have_content('08/02/2017')
  end

end
