feature 'Viewing one space'do
  scenario 'User can view a space on its own page' do
    sign_up
    space_form
    # Space.create(name: 'Holo Pad', description: 'Pink apartment', price: 500)
    # visit('/spaces')
    click_button ' b o o k '
    expect(current_path).to eq '/spaces/'
  end
end
