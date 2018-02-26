require_relative('../db/sql_runner.rb')
require_relative('../models/competition.rb')
require_relative('../models/team.rb')
require_relative('../models/venue.rb')

class Match

  attr_reader :id, :venue_id, :home_team_id, :away_team_id, :competition_id, :home_team_score, :away_team_score, :date, :comments

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @venue_id = options['venue_id'].to_i
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @competition_id = options['competition_id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_score = options['away_team_score'].to_i
    @date = options['date']
    @comments = options['comments']
  end

  def save()
    sql = "INSERT INTO matches
      (
        venue_id,
        home_team_id,
        away_team_id,
        competition_id,
        home_team_score,
        away_team_score,
        date,
        comments
      )
      VALUES
      (
        $1, $2, $3, $4, $5, $6, $7, $8
      )
      RETURNING id;"
    result = SqlRunner.run(sql, [@venue_id, @home_team_id, @away_team_id, @competition_id, @home_team_score, @away_team_score, @date, @comments])
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE matches
      SET
      (
        venue_id,
        home_team_id,
        away_team_id,
        competition_id,
        home_team_score,
        away_team_score,
        date,
        comments
      ) =
      (
        $1, $2, $3, $4, $5, $6, $7, $8
      )
      WHERE id = $9;"
    SqlRunner.run(sql, [@venue_id, @home_team_id, @away_team_id, @competition_id, @home_team_score, @away_team_score, @date, @comments, @id])
  end

  def delete()
    sql = "DELETE FROM matches WHERE id = $1;"
    SqlRunner.run(sql, [@id])
  end

  def venue()
    sql = "SELECT * FROM venues WHERE id = $1;"
    result = SqlRunner.run(sql, [@venue_id])
    return Venue.new(result[0])
  end

  def home_team()
    sql = "SELECT * FROM teams WHERE id = $1;"
    result = SqlRunner.run(sql, [@home_team_id])
    return Team.new(result[0])
  end

  def away_team()
    sql = "SELECT * FROM teams WHERE id = $1;"
    result = SqlRunner.run(sql, [@away_team_id])
    return Team.new(result[0])
  end

  def competition()
    sql = "SELECT * FROM competitions WHERE id = $1;"
    result = SqlRunner.run(sql, [@competition_id])
    return Competition.new(result[0])
  end

  def winner()
    return "home" if @home_team_score > @away_team_score
    return "away" if @away_team_score > @home_team_score
    return "draw"
  end

  def Match.all()
    sql = "SELECT * FROM matches;"
    result = SqlRunner.run(sql)
    return result.map{|match| Match.new(match)}
  end

  def Match.delete_all()
    sql = "DELETE FROM matches;"
    SqlRunner.run(sql)
  end

  def Match.find(match_id)
    sql = "SELECT * FROM matches WHERE id = $1;"
    result = SqlRunner.run(sql, [match_id])
    return Match.new(result[0])
  end

  def Match.sort_by_date()
    sql = "SELECT * FROM matches ORDER BY date;"
    result = SqlRunner.run(sql)
    return result.map{|match| Match.new(match)}
  end

  def Match.sort_by_venue()
    sql = "SELECT m.* FROM matches m
    INNER JOIN venues v
    ON m.venue_id = v.id
    ORDER BY v.name;"
    result = SqlRunner.run(sql)
    return result.map{|match| Match.new(match)}
  end

  def Match.sort_by_home_team()
    sql = "SELECT m.* FROM matches m
    INNER JOIN teams t
    ON m.home_team_id = t.id
    ORDER BY t.name;"
    result = SqlRunner.run(sql)
    return result.map{|match| Match.new(match)}
  end

  def Match.sort_by_away_team()
    sql = "SELECT m.* FROM matches m
    INNER JOIN teams t
    ON m.away_team_id = t.id
    ORDER BY t.name;"
    result = SqlRunner.run(sql)
    return result.map{|match| Match.new(match)}
  end

  def Match.sort_by_competition()
    sql = "SELECT m.* FROM matches m
    INNER JOIN competitions c
    ON m.competition_id = c.id
    ORDER BY c.name;"
    result = SqlRunner.run(sql)
    return result.map{|match| Match.new(match)}
  end

end
