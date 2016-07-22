require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new store', {:type => :feature}) do
  it "allows user to add a new store" do
    visit('/')
    fill_in('name', :with => 'obchod')
    click_button('Add new store')
    expect(page). to have_content("Obchod")

  end
end
