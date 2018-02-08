feature 'One space'do

  context 'has its own page' do

    scenario 'which the user can visit by clicking "view"' do
      go_to_single_space
      expect(current_path).to eq '/spaces/1'
    end

    context 'which displays' do

      scenario 'the name of the space' do
        go_to_single_space
        expect(page).to have_content "Holo Pad"
      end

      scenario 'the description of the space' do
        go_to_single_space
        expect(page).to have_content "Holographic neon dream for two aesthetics"
      end

      scenario 'the price of the space' do
        go_to_single_space
        expect(page).to have_content "Δ 500"
      end

      scenario 'a "back" button which returns to the list of spaces' do
        go_to_single_space
        click_button(" ← ")
        expect(current_path).to eq '/spaces'
      end

    end

  end

end
