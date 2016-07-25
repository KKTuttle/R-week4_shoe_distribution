require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new store', {:type => :feature}) do
  it "allows user to add a new store" do
    visit('/')
    fill_in('name', :with => 'obchod')
    click_button('Add new store')
    expect(page).to have_content('Obchod')
  end
end

describe('viewing list of all saved stores', {:type => :feature}) do
  it "allows user see all saved stores" do
    visit('/')
    fill_in('name', :with => 'obchod')
    click_button('Add new store')
    fill_in('name', :with => 'Store')
    click_button('Add new store')
    expect(page).to have_content('Store')
  end
end

describe('renaming a saved store', {:type => :feature}) do
  it "allows user to rename already saved store" do
    store = Store.new(:name => 'Obchod', :id => nil)
    store.save()
    visit('/')
    click_link('Edit')
    fill_in('new_name', :with => 'Store')
    click_button('Change Name')
    expect(page).to have_content('Store')
  end
end

describe('deleting a store', {:type => :feature}) do
  it "allows user to delete a saved store" do
    store = Store.new(:name => 'Obchod', :id => nil)
    store.save()
    visit('/')
    click_link('Edit')
    click_button('Delete Obchod')
    expect(page).to have_no_content('Obchod')
  end
end
