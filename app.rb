require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all()
  @brands = Brand.all()
  erb(:index)
end
# ADDING STORE

get('/stores') do
    @stores = Store.all()
    erb :form_store
end

post('/stores') do
  name = params.fetch('name')
  image = params.fetch('store_image')
  @store = Store.new({:name => name, :image => image, :id => nil})
  @stores = Store.all()
  if @store.save()
    redirect to("/")
  else
    erb(:error_store)
  end
end

get('/brands') do
  @brands = Brand.all()
    erb :form_brand
end

# ADDING BRAND
post('/brands') do
  name = params.fetch('brand_name')
  logo = params.fetch('brand_logo')
  @brand = Brand.new({:name => name, :logo=> logo, :id => nil})
  @brands = Brand.all()
  if @brand.save()
    redirect to("/")
  else
    erb(:error_brand)
  end
end

get('/brand/:id') do
  @stores = Store.all()
  @brand = Brand.find(params.fetch('id').to_i())
  erb(:brand)
end
# select from brand page
post '/brand/:id/store' do
  @stores = Store.all()
  brand_id = params['brand_id'].to_i
  store_id = params['store_id'].to_i
  store = Store.find(store_id)
  @brand = Brand.find(params['id'].to_i)
  if !@brand.stores.include?(store)
    @brand.stores.push(store)
  end
  redirect to("/brand/#{@brand.id()}")
end

# select from store page
post '/store/:id/brand' do
  @brands = Brand.all()
  store_id = params['store_id'].to_i
  brand_id = params['brand_id'].to_i
  brand = Brand.find(brand_id)
  @store = Store.find(params['id'].to_i)
  if !@store.brands.include?(brand)
    @store.brands.push(brand)
  end
  redirect to("/store/#{@store.id()}")
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
  @brands = Brand.all()
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
  @brands = Brand.all()
  erb(:store)
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
