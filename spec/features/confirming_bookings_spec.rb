feature 'confirming a booking' do

  scenario 'new bookings are uncomfirmed' do
    sign_up
    space_form
    book_a_space
    expect(Booking.first.confirmed).to eq false
  end

  scenario 'bookings can be confirmed (in database)' do
    sign_up
    space_form
    book_a_space
    Booking.first.confirm
    expect(Booking.first.confirmed).to eq true
  end

  scenario 'booking is shown on management page' do
    sign_up
    space_form
    book_a_space
    visit('/welcome')
    click_button ("▩ m a n a g e _ b o o k i n g s ▩")
    expect(page).to have_content('08/02/2017')
  end

  scenario 'the customer is shown on management page' do
    sign_up
    space_form
    book_a_space
    visit('/welcome')
    click_button ("▩ m a n a g e _ b o o k i n g s ▩")
    expect(page).to have_content('tester')
  end

  scenario 'bookings can be confirmed (website)' do
    sign_up
    space_form
    book_a_space
    confirm_booking
    expect(Booking.first.confirmed).to eq true
    expect(page).to have_content '☥☥ B0⦰KING C⦰NF|rmD ☥☥'
  end

  scenario 'confirmed bookings are not displayed on the manage bookings page' do
    sign_up
    space_form
    book_a_space
    confirm_booking
    visit('/welcome')
    click_button ("▩ m a n a g e _ b o o k i n g s ▩")
    expect(page).not_to have_content 'Holo Pad'
  end

end
