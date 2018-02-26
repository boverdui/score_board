require_relative('../db/sql_runner.rb')

class Team

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO teams
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
    sql = "UPDATE teams SET name = $1 WHERE id = $2;"
    SqlRunner.run(sql, [@name, @id])
  end

  def delete()
    sql = "DELETE FROM teams WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end

  def Team.all()
    sql = "SELECT * FROM teams ORDER BY name;"
    result = SqlRunner.run(sql)
    return result.map{|team| Team.new(team)}
  end

  def Team.delete_all()
    sql = "DELETE FROM teams;"
    SqlRunner.run(sql)
  end

end
