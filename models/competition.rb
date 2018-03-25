require_relative('../db/sql_runner.rb')

class Competition

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    @name = @name.sanitize()
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

  def matches()
    sql = "SELECT * FROM matches WHERE competition_id = $1"
    result = SqlRunner.run(sql, [@id])
    return result.map{|competition| Competition.new(competition)}
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

  def Competition.find(competition_id)
    sql = "SELECT * FROM competitions WHERE id = $1;"
    result = SqlRunner.run(sql, [competition_id])
    return Competition.new(result[0])
  end

  def Competition.exists?(name)
    name = name.sanitize()
    sql = "SELECT * FROM competitions WHERE name = $1;"
    result = SqlRunner.run(sql, [name])
    return result.any?
  end

end
