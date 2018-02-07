feature 'Listing spaces' do
  scenario 'Adding a space' do
    sign_up
    space_form
    expect(current_path).to eq '/spaces'
    expect(page).to have_text('Holo Pad')
  end

end
