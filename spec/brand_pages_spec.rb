require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new brand', {:type => :feature}) do
  it "allows user to add a new brand" do
    store = Store.new(:name => 'Obchod', :id => nil)
    store.save()
    visit('/')
    click_link('Obchod')
    fill_in('brand_name', :with => 'znacka')
    click_button('Add new brand')
    expect(page).to have_content('Znacka')
  end
end
