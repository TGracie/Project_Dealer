require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( './controllers/cars_controller.rb' )
require_relative( './controllers/customers_controller.rb' )
require_relative( './controllers/shops_controller.rb' )

get '/' do
  erb(:index)
end
