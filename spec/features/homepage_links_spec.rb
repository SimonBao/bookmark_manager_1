feature 'Opening homepage' do
  scenario 'homepage displays welcome text' do
    visit('/')
    expect(page).to have_content('Welcome to Bookmark Manager!')
  end
end

feature 'Viewing links' do
  scenario 'visibility of existing links on the homepage' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page).to have_content('Makers Academy')
  end
end
