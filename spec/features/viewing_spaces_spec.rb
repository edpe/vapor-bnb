feature 'Viewing spaces' do
  scenario 'I can see existing spaces on the page' do
    sign_up
    space_form
    visit '/spaces'
    within 'ul#spaces' do
      expect(page).to have_content('Holo Pad')
    end
  end

  scenario 'the space has a user' do
    sign_up
    space_form
    expect(page).to have_content("tester")
  end
end
