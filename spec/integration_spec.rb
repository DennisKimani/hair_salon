require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', type: :feature) do
  it('allows a user to click a stylist to see the client and details for it') do
    visit('/')
    click_link('Add a new Stylist')
    fill_in('name', with: 'Jane')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
  end
end

describe('viewing all of the stylists', type: :feature) do
  it('allows a user to see all of the stylists that have been created') do
    stylist = Stylist.new(name: 'Moringaschool Homework')
    stylist.save
    visit('/')
    click_link('View All Stylists')
    expect(page).to have_content(stylist.name)
  end
end

describe('seeing details for a single stylist', type: :feature) do
  it('allows a user to click a stylist to see the clients and details for it') do
    test_stylist = Stylist.new(name: 'School stuff')
    test_stylist.save
    test_client = Client.new(description: 'learn SQL', stylist_id: test_stylist.id)
    test_client.save
    visit('/stylists')
    click_link(test_stylist.name)
    expect(page).to have_content(test_client.description)
  end
end
