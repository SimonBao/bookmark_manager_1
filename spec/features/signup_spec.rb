feature 'Signs up user' do
  scenario 'I can sign in as new user' do
    sign_up
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('simon@yaoogle.com')
    expect(User.first.email).to eq ('simon@yaoogle.com')
  end
end

def sign_up
  visit '/users/new'
  fill_in :email, with: 'simon@yaoogle.com'
  fill_in :password, with: '1234567890'
  click_button 'Register'
end
