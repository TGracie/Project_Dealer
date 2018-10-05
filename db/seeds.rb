require_relative('../models/shop.rb')
require_relative('../models/car.rb')
require_relative('../models/customer.rb')

Shop.delete_all()

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
