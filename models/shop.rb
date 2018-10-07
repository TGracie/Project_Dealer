require_relative('../db/sql_runner.rb')

class Shop

  #####################################################################
  attr_reader( :id, :name )
  attr_accessor( :till )
  #####################################################################

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @till = options['till'].to_i()
  end
  #####################################################################
  #####################################################################
  ## CLASS METHODS ##

  def self.all()
    sql = "SELECT * FROM shops"
    shops_hash = SqlRunner.run(sql)
    result = shops_hash.map{|shop| Shop.new(shop)}
    return result
  end
  #####################################################################

  def self.delete_all()
    sql = "DELETE FROM shops"
    SqlRunner.run(sql)
  end

  #####################################################################
  #####################################################################
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
  #####################################################################

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
  #####################################################################

  def delete()
    sql = "DELETE FROM shops
           WHERE id = $1"
           values = [@id]
    SqlRunner.run(sql, values)
  end
  ####################################################################
  # things to add......
  # stock function? what cars do we have in stock?
  def stock_list
    sql = "SELECT * FROM cars
           WHERE shop_id = id"
    cars = SqlRunner.run(sql)
    result = cars.map{|car| Car.new(car)}
    return result
  end
  #####################################################################
  #   brand function, see above
  def brands
    sql = "SELECT cars.make FROM cars
           WHERE shop_id = id"
    brands = SqlRunner.run(sql)
    result = brands.map{|brand| Car.new(brand)}
    return result
  end
  #   price filtering? does this go here? maybe
  #  stock valuation
  def value
    value = stock_list.price * stock_list.count
    return value
  end

#######################################################################
#######################################################################
#######################################################################
end ## class end
