feature 'Viewing spaces' do
  scenario 'I can see existing spaces on the page' do
    Space.create(name: 'Holo Pad', description: 'Holographic neon dream for two aesthetics', price: '500')
    visit '/spaces'
    within 'ul#spaces' do
      expect(page).to have_content('Holo Pad')
    end
  end
end
