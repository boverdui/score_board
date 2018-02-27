require_relative('../db/sql_runner.rb')

class Venue

  attr_reader :id, :name, :city, :country

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @city = options['city']
    @country = options['country']
  end

  def save()
    sql = "INSERT INTO venues
      (
        name,
        city,
        country
      )
      VALUES
      (
        $1, $2, $3
      )
      RETURNING id;"
    result = SqlRunner.run(sql, [@name, @city, @country])
    @id = result[0]['id'].to_i
  end

  # def update()
  #   sql = "UPDATE venues
  #     SET
  #     (
  #       name,
  #       city,
  #       country
  #     ) =
  #     (
  #       $1, $2, $3
  #     )
  #     WHERE id = $4;"
  #   SqlRunner.run(sql, [@name, @city, @country, @id])
  # end
  #
  # def delete()
  #   sql = "DELETE FROM venues WHERE id = $1;"
  #   SqlRunner.run(sql, [@id])
  # end
  
  def Venue.all()
    sql = "SELECT * FROM venues ORDER BY name;"
    result = SqlRunner.run(sql)
    return result.map{|venue| Venue.new(venue)}
  end

  def Venue.delete_all()
    sql = "DELETE FROM venues;"
    SqlRunner.run(sql)
  end

end
