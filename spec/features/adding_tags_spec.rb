feature 'Adding tags to the link' do
  scenario 'I can add multiple tags to the link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    # our tags will be space separated
    fill_in 'tags',  with: 'search engine, coding, education'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to eq(['search engine', 'coding', 'education'])
  end
end
