require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to click a stylist to see the task and details for it') do
    visit('/')
    click_link('Add a new Stylist')
    fill_in('name', :with =>'Jane')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
  end
end
