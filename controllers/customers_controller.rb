require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/car.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/shop.rb' )
also_reload( '../models/*' )

## INDEX ##
get ('/customers') do
  @customers = Customer.all
  erb(:"customers/index")
end

## CREATE ##
get ('/customers/new') do
  @customers = Customer.all
  erb(:"customers/new")
end

post ('/customers') do
  customer = Customer.new(params)
  customer.save
  redirect to ("/customers")
end

## SHOW ##
get('/customers/:id') do
  @id = params[:id].to_i
  @customer = Customer.find(@id)
  erb(:"customers/show")
end

## EDIT ##
get('/customers/:id/edit') do
  @id = params[:id].to_i
  @customer = Customer.find(@id)
  erb(:"customers/edit")
end

## UPDATE ##
post ('/customers/:id') do
  customer = Customer.new(params)
  customer.update
  redirect to('/customers')
end

## DELETE ##
post('/customers/:id/delete') do
  id = params[:id].to_i
  @customer = Customer.find(id)
  @customer.delete
  redirect to('/customers')
end

## CUSTOMER RELEVANT CARS ##
get ('/customers/:id/:choice') do
  id = params[:id].to_i
  @customer = Customer.find(id)
  @customer_option = @customer.cars if params["choice"] == "relevant"
  @customer_option = @customer.in_budget if params["choice"] == "in-budget"
  @customer_option = @customer.both if params["choice"] == "both"
    erb(:"customers/filtered")
  end

# get ('/customers/:id/relevant') do
#   id = params[:id].to_i
#   @customer = Customer.find(id)
#   @customer.cars
#   erb(:"customers/brands")
# end
#
# get ('/customers/:id/in-budget') do
#   id = params[:id].to_i
#   @customer = Customer.find(id)
#   @customer.budget
#   erb(:"customers/budget")
# end
#
# get ('/customers/:id/both') do
#   id = params[:id].to_i
#   @customer = Customer.find(id)
#   @customer.both
#   erb(:"customers/both")
# end


## give these methods a variable for the method being called and then plug that in to the same view page
