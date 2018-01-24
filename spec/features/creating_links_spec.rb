feature 'Creating links' do

  scenario 'I can create a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.zombo.com/'
    fill_in 'title', with: 'This is Zombocom'
    click_button 'Create link'

    expect(page).to have_content('This is Zombocom')
  end

  scenario 'I can add a specific tag to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.bbc.co.uk'
    fill_in 'title', with: 'This is BBC'
    fill_in 'tags', with: 'News'

    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('News')
  end

end
