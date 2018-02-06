feature 'listing spaces' do
  scenario 'adding a space' do
    visit('/spaces/new')
    fill_in('name', with: 'Holo Pad')
    fill_in('description', with: 'Holographic neon dream for two aesthetics')
    fill_in('price', with: 'Δ500')
    click_button 'Create space'
    space = Space.first
    expect(page).to include('Holo Pad')
  end

  
end
