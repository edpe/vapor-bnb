feature 'booking spaces' do
  scenario 'each space has a book button' do
    sign_up
    space_form
    sign_up('Lil Fangz','A C I D S L V G','lilfangz@fijiwater.co.uk','beyourvapor')
    visit('/spaces')
    expect(page).to have_selector("input[value=' v i e w ']")
  end

  scenario 'book button redirects to page for space' do
    sign_up
    space_form
    sign_up('Lil Fangz','A C I D S L V G','lilfangz@fijiwater.co.uk','beyourvapor')
    visit('/spaces')
    click_button ' v i e w '
  end
end
