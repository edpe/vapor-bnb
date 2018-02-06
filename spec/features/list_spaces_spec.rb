feature 'Listing spaces' do
  scenario 'Adding a space' do
    visit('/spaces/new')
    fill_in('name', with: 'Holo Pad')
    fill_in('description', with: 'Holographic neon dream for two aesthetics')
    fill_in('price', with: '500')
    click_button 'list space'
    expect(current_path).to eq '/spaces'
    expect(page).to have_text('Holo Pad')
  end

end
