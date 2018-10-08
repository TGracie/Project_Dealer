require_relative('../models/shop.rb')
require_relative('../models/car.rb')
require_relative('../models/customer.rb')
require('pry')

Shop.delete_all()
Car.delete_all()
Customer.delete_all()

#######################################################################
#######################################################################
## SHOPS SEEDS ##
shop1 = Shop.new({
  "name" => "Chips Whips",
  "till" => 100000
})

shop1.save()

#######################################################################
#######################################################################
## CARS SEEDS ##

ftype = Car.new({
  "shop_id" => shop1.id,
  "make" => "Jaguar",
  "model" => "F-Type",
  "style" => "Sports",
  "price" => 72000,
  "image" => ""
  })

quad = Car.new({
  "shop_id" => shop1.id,
  "make" => "Alfa Romeo",
  "model" => "Giulia Quadifoglio",
  "style" => "Saloon",
  "price" => 63000,
  "image" => ""
  })

 fiesta = Car.new({
  "shop_id" => shop1.id,
  "make" => "Ford",
  "model" => "Fiesta ST",
  "style" => "Hot-Hatch",
  "price" => 22000,
  "image" => ""
  })

  ftype.save
  quad.save
  fiesta.save
  #####################################################################
  #####################################################################
  ## CUSTOMER SEEDS ##

customer1 = Customer.new({
  "name" => "Thomas Gracie",
  "budget" => 100000,
  "email" => "123@fakemail.com",
  "previous_brand" => "Volvo"
  })

customer2 = Customer.new({
  "name" => "Atlanta Pritchard-Barrett",
  "budget" => 100000,
  "email" => "321@fakemail.com",
  "previous_brand" => "Saab"
  })
# binding.pry
  customer1.save
  customer2.save

#######################################################################
#######################################################################
