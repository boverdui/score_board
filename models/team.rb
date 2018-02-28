require_relative('../db/sql_runner.rb')
require_relative('../models/match.rb')

class Team

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    @name = @name.gsub(/[A-Za-z]+/,&:capitalize)
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

  def matches()
    sql = "SELECT * FROM matches WHERE home_team_id = $1 OR away_team_id = $1"
    result = SqlRunner.run(sql, [@id])
    return result.map{|team| Team.new(team)}
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

  def Team.find(team_id)
    sql = "SELECT * FROM teams WHERE id = $1;"
    result = SqlRunner.run(sql, [team_id])
    return Team.new(result[0])
  end

  def Team.exists?(name)
    name = name.gsub(/[A-Za-z]+/,&:capitalize)
    sql = "SELECT * FROM teams WHERE name = $1;"
    result = SqlRunner.run(sql, [name])
    return result.any?
  end

end
