require_relative('../db/sql_runner.rb')

class Car
#######################################################################
  attr_reader
  attr_accessor
  #####################################################################
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @shop_id = options['shop_id'].to_i
    @make = options['make']
    @model = options['model']
    @style = options['style']
    @price = options['price']
    @image = options['image']
  end

  #####################################################################
  #####################################################################
  ## CLASS METHODS ##

  def self.all()
  end
  #####################################################################

  def self.delete_all()
  end
  #####################################################################

  def self.find(id)
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
  end
  #####################################################################

  def delete
  end
  #####################################################################
  #####################################################################
  #####################################################################
end ## class end
