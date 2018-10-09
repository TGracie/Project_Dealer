require_relative('../db/sql_runner.rb')

class Shop

  ####################################################################
  attr_reader( :id, :name )
  attr_accessor( :till )
  ####################################################################

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @till = options['till'].to_i()
  end
  ####################################################################
  ####################################################################
  ## CLASS METHODS ##

  def self.all()
    sql = "SELECT * FROM shops"
    shops_hash = SqlRunner.run(sql)
    result = shops_hash.map{|shop| Shop.new(shop)}
    return result
  end
  ####################################################################

  def self.delete_all()
    sql = "DELETE FROM shops"
    SqlRunner.run(sql)
  end
  ####################################################################

  def self.find(id)
    sql = "SELECT * FROM shops WHERE id = $1"
    values = [id]
    shop = SqlRunner.run(sql, values)
    result = Shop.new(shop.first)
    return result
  end

  ####################################################################
  ####################################################################
  ## OBJECT METHODS ##
  def save()
    sql = "INSERT INTO shops (
    name,
    till)

    VALUES ($1, $2)
    RETURNING id;"

    values = [@name, @till]

    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end
  ####################################################################

  def update()
    sql = "UPDATE shops
           SET
           (name, till)
           =
           ($1, $2)
           WHERE id = $3"
           values = [@name, @till]
    SqlRunner.run(sql, values)
  end
  ####################################################################

  def delete()
    sql = "DELETE FROM shops
           WHERE id = $1"
           values = [@id]
    SqlRunner.run(sql, values)
  end
  ####################################################################
  # things to add......
  # stock function? what cars do we have in stock?
  def stock
    sql = "SELECT * FROM cars
           WHERE shop_id = $1"
           value = [@id]
    cars = SqlRunner.run(sql, value)
    result = cars.map{|car| Car.new(car)}
    return result
  end
  ####################################################################
  #   brand function, see above
  # def brands ## working but returning all other fields as well, want just a list of brands
  #   sql = "SELECT cars.make FROM cars
  #          WHERE shop_id = $1"
  #          values = [@id]
  #   brands = SqlRunner.run(sql, values)
  #   result = brands.map{|brand| Car.new(brand)}
  #   return result
  #   # return brands
  # end
  # making it far more complex than it needs to be, follow the valuation function and just call the .make on all of them! Easy peasy!
  def brands
    car_brands = stock.map{|car| car.make}
    return car_brands
  end
  #   price filtering? does this go here? maybe
######################################################################
  #  stock valuation
  def value ## works great, needed to remember .to_i in the initialize
    car_prices = stock.map{|car| car.price}
    return car_prices.sum
  end
  ####################################################################

######################################################################
######################################################################
######################################################################
end ## class end
