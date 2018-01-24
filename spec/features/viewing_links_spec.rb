feature 'Filtering through links' do

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.johnlewis.com', title: 'John Lewis', tags: [Tag.first_or_create(name: 'shopping')])
    Link.create(url: 'http://www.amazon.co.uk', title: 'Amazon', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.selfridges.com', title: 'Selfridges', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'I can filter links by a specific tag' do
    visit '/tags/bubbles'
    expect(page).not_to have_content('Makers Academy')
    expect(page).not_to have_content('John Lewis')
    expect(page).to have_content('Amazon')
    expect(page).to have_content('Selfridges')
  end
end
