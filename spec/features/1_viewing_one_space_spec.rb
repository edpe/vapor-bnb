feature 'Viewing one space'do
  scenario 'User can view a space on its own page' do
    sign_up
    space_form
    click_button ' b o o k '
    expect(current_path).to eq '/spaces/1'
  end
end
