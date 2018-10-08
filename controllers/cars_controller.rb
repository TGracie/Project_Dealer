require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/car.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/shop.rb' )
also_reload( '../models/*' )

get '/cars' do
  @cars = Car.all
  erb( :"cars/index" )
end

get '/cars/new' do
  erb(:"cars/new")
end

post '/cars' do
  car = Car.new(params)
  car.save
  redirect to("/cars")
end
