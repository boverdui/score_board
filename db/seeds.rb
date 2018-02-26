require_relative('../models/competition.rb')
require_relative('../models/match.rb')
require_relative('../models/team.rb')
require_relative('../models/venue.rb')

Match.delete_all()
Competition.delete_all()
Team.delete_all()
Venue.delete_all()

venue1 = Venue.new({
  "name" => "Murrayfield",
  "city" => "Edinburgh",
  "country" => "Scotland"
})

venue2 = Venue.new({
  "name" => "Principality Stadium",
  "city" => "Cardiff",
  "country" => "Wales"
})

venue3 = Venue.new({
  "name" => "Twickenham",
  "city" => "London",
  "country" => "England"
})

venue4 = Venue.new({
  "name" => "Stade de France",
  "city" => "Paris",
  "country" => "France"
})

venue5 = Venue.new({
  "name" => "Stadio Olimpico",
  "city" => "Rome",
  "country" => "Italy"
})

venue6 = Venue.new({
  "name" => "Aviva Stadium",
  "city" => "Dublin",
  "country" => "Ireland"
})

venue7 = Venue.new({
  "name" => "Myreside",
  "city" => "Edinburgh",
  "country" => "Scotland"
})

venue1.save()
venue2.save()
venue3.save()
venue4.save()
venue5.save()
venue6.save()
venue7.save()

team1 = Team.new({"name" => "England"})
team2 = Team.new({"name" => "France"})
team3 = Team.new({"name" => "Ireland"})
team4 = Team.new({"name" => "Italy"})
team5 = Team.new({"name" => "Scotland"})
team6 = Team.new({"name" => "Wales"})
team7 = Team.new({"name" => "Glasgow Warriors"})
team8 = Team.new({"name" => "Munster Rugby"})
team9 = Team.new({"name" => "Toyota Cheetahs"})
team10 = Team.new({"name" => "Cardiff Blues"})
team11 = Team.new({"name" => "Connacht Rugby"})
team12 = Team.new({"name" => "Ospreys"})
team13 = Team.new({"name" => "Zebre Rugby Club"})
team14 = Team.new({"name" => "Leinster Rugby"})
team15 = Team.new({"name" => "Scarlets"})
team16 = Team.new({"name" => "Edinburgh Rugby"})
team17 = Team.new({"name" => "Ulster Rugby"})
team18 = Team.new({"name" => "Benetton Rugby"})
team19 = Team.new({"name" => "Dragons"})
team20 = Team.new({"name" => "Southern Kings"})

team1.save()
team2.save()
team3.save()
team4.save()
team5.save()
team6.save()
team7.save()
team8.save()
team9.save()
team10.save()
team11.save()
team12.save()
team13.save()
team14.save()
team15.save()
team16.save()
team17.save()
team18.save()
team19.save()
team20.save()


competition1 = Competition.new({"name" => "Six Nations"})
competition2 = Competition.new({"name" => "PRO14"})
competition3 = Competition.new({"name" => "PRO12"})
competition4 = Competition.new({"name" => "European Challenge Cup"})
competition5 = Competition.new({"name" => "European Champions Cup"})

competition1.save()
competition2.save()
competition3.save()
competition4.save()
competition5.save()

match1 = Match.new({
  "venue_id" => venue1.id,
  "home_team_id" => team5.id,
  "away_team_id" => team2.id,
  "competition_id" => competition1.id,
  "home_team_score" => 32,
  "away_team_score"=> 26,
  "date" => "2018-02-11",
  "comments" => ""
})

match2 = Match.new({
  "venue_id" => venue2.id,
  "home_team_id" => team6.id,
  "away_team_id" => team5.id,
  "competition_id" => competition1.id,
  "home_team_score" => 34,
  "away_team_score"=> 7,
  "date" => "2018-02-03",
  "comments" => ""
})

match1.save()
match2.save()
