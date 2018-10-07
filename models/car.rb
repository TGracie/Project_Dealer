require_relative('../db/sql_runner.rb')

class Car
#######################################################################
  attr_reader( :id, :shop_id)
  attr_accessor( :make, :model, :style, :price, :image)
  #####################################################################
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @shop_id = options['shop_id'].to_i
    @make = options['make']
    @model = options['model']
    @style = options['style']
    @price = options['price'].to_i
    @image = options['image']
  end

  #####################################################################
  #####################################################################
  ## CLASS METHODS ##

  def self.all()
    sql = "SELECT * FROM cars"
    cars = SqlRunner.run(sql)
    result = cars.map{|car| Car.new(car)}
    return result
  end
  #####################################################################

  def self.delete_all()
    sql = "DELETE FROM cars"
    SqlRunner.run(sql)
  end
  #####################################################################

  def self.find(id)
    sql = "SELECT * FROM cars WHERE id = $1"
    values = [@id]
    car = SqlRunner.run(sql, values)
    result = Car.new(car.first)
    return result
  end
  #####################################################################
  #####################################################################
  ## OBJECT METHODS ##

  def save
    sql = "INSERT INTO cars(
          shop_id,
          make,
          model,
          style,
          price
        )
        VALUES ($1, $2, $3, $4, $5)
        RETURNING id;"
        values = [@shop_id, @make, @model, @style, @price]
        @id = SqlRunner.run(sql,values)[0]['id'].to_i
  end
  #####################################################################

  def update
    sql = "UPDATE cars
        SET (
          make,
          model,
          style,
          price,
          image
          ) =
          ($1, $2, $3, $4, $5)
          WHERE id = $6"
          values = [@make, @model, @style, @price, @image, @id]
          SqlRunner.run(sql, values)
  end
  #####################################################################

  def delete
    sql = "DELETE * FROM cars
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
  #####################################################################
  #####################################################################
  #####################################################################
end ## class end
