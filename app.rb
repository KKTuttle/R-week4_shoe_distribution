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
# RENAMING A STORE
patch('/stores/:id/name') do
  @store = Store.find(params.fetch('id').to_i())
  name = params.fetch('new_name')
  @store = @store.update({:name => name})
  @stores = Store.all()
  erb(:index)
end
# DELETING A STORE
delete('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @store.destroy()
  redirect to("/")
end

get('/store/:id') do
  @store = Store.find(params.fetch('id').to_i())
  erb(:store)
end
# ADDING A BRAND TO A STORE
post('/store/:id') do
  name = params.fetch('brand_name')
  store_id = params.fetch('store_id').to_i()
  @brand = Brand.new({:name => name, :id => nil})
  @store = Store.find(store_id)
  @store.brands.create({:name => name})
  if @brand.save()
    redirect to("/store/#{@store.id()}")
  else
    erb(:error_brand)
  end
end

get("/clear") do
  Brand.all().each() do |brand|
    brand.destroy()
  end
  Store.all().each() do |store|
    store.destroy()
  end
  redirect("/")
end
