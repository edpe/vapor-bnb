feature 'Listing spaces' do
  scenario 'Adding a space' do
    sign_up
    space_form
    expect(current_path).to eq '/spaces'
    expect(page).to have_text('Holo Pad')
  end

  context 'the user can' do

    scenario 'return to the spaces list by pressing the back button' do
      sign_up
      visit('spaces/new')
      click_button(" ← ")
      expect(current_path).to eq '/spaces'
    end

  end

end
