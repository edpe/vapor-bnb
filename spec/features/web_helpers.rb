def sign_up(name = 'Test Bloggs', username = 'tester', email = 'test@test.co.uk', password = 'testing123', password_confirmation = password)
  visit('/')
  fill_in('name', with: name)
  fill_in('username', with: username)
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button("☯ シ m y  b o d y  i s  r e a d y")
end

def space_form(name = 'Holo Pad', description = 'Holographic neon dream for two aesthetics', price = '500')
  visit('spaces/new')
  fill_in('name', with: name)
  fill_in('description', with: description)
  fill_in('price', with: price)
  click_button 'list space'
end

def go_to_single_space
  sign_up
  space_form
  click_button ' v i e w '
end

def book_a_space
  click_button (' v i e w ')
  fill_in('date', with: '08/02/2017')
  click_button (' b o o k ')
end

def confirm_booking
  visit('/welcome')
  click_button ("▩ m a n a g e _ b o o k i n g s ▩")
  click_button (' c o n f i r m ')
end
