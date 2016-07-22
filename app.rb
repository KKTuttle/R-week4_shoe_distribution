require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end
# ADDING STORE
post('/stores') do
  name = params.fetch('name')
  @store = Store.new({:name => name, :id => nil})
  @stores = Store.all()
  if @store.save()
    erb(:index)
  else
    erb(:error_store)
  end
end

get('/stores/:id/edit') do
  @store = Store.find(params.fetch('id').to_i())
  @stores = Store.all()
  erb(:store_edit)
end

patch('/stores/:id/name') do
  @store = Store.find(params.fetch('id').to_i())
  name = params.fetch('new_name')
  @store = @store.update({:name => name})
  # without this list of all save stores won't be showing if I redirectto this page

  # redirect to ("/stores/#{@store.id()}/edit")
  @stores = Store.all()
  erb(:index)
end

delete('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @store.destroy()
  redirect to("/")
end

get('/store/:id') do
  @store = Store.find(params.fetch('id').to_i())
  erb(:store)
end

post('/store/:id') do
  name = params.fetch('brand_name')
  store_id = params.fetch('store_id').to_i()
  @brand = Brand.new({:name => name, :id => nil})
  @store = Store.find(store_id)
  @store.brands.create({:name => name})
  if @brand.save()
    erb(:store)
  else
    erb(:error_brand)
  end
end
