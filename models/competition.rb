require_relative('../db/sql_runner.rb')

class Competition

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO competitions
      (
        name
      )
      VALUES
      (
        $1
      )
      RETURNING id;"
    result = SqlRunner.run(sql, [@name])
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE competitions SET name = $1 WHERE id = $2;"
    SqlRunner.run(sql, [@name, @id])
  end

  def delete()
    sql = "DELETE FROM competitions WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end

  def Competition.all()
    sql = "SELECT * FROM competitions ORDER BY name;"
    result = SqlRunner.run(sql)
    return result.map{|competition| Competition.new(competition)}
  end

  def Competition.delete_all()
    sql = "DELETE FROM competitions;"
    SqlRunner.run(sql)
  end

end
