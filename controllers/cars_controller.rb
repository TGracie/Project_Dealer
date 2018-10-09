require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/car.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/shop.rb' )
also_reload( '../models/*' )

## INDEX ##
get '/cars' do
  @cars = Car.all
  erb( :"cars/index" )
end

## CREATE ##
get '/cars/new' do
  @shops = Shop.all
  erb(:"cars/new")
end

post '/cars' do
  car = Car.new(params)
  car.save
  redirect to("/cars")
end

## SHOW ##
get ('/cars/:id') do
  @id = params[:id].to_i
  # binding.pry
  @car = Car.find(@id)
  erb(:"cars/show")
end

## EDIT ##
get('/cars/:id/edit') do
  @id = params[:id].to_i
  @car = Car.find(@id)
  erb(:"cars/edit")
end

## UPDATE ##
post('/cars/:id') do
  car = Car.new(params)
  car.update
  redirect to('/cars')
end

## DELETE ##
post ('/cars/:id/delete') do
  id = params[:id].to_i
  @car = Car.find(id)
  @car.delete()
  redirect to('/cars')
end
