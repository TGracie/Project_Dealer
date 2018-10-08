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
  id = params[:id].to_i
  # binding.pry
  @car = Car.find(id)
  erb(:"cars/show")
end
