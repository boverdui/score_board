require_relative('../models/competition.rb')
require_relative('../models/match.rb')
require_relative('../models/team.rb')
require_relative('../models/venue.rb')

Match.delete_all()
Venue.delete_all()
Team.delete_all()
Competition.delete_all()

venue1 = Venue.new({
  "name" => "Murrayfield Stadium",
  "city" => "Edinburgh",
  "country" => "Scotland"
})

venue2 = Venue.new({
  "name" => "Principality Stadium",
  "city" => "Cardiff",
  "country" => "Wales"
})

venue3 = Venue.new({
  "name" => "Twickenham Stadium",
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
  "name" => "Myreside Stadium",
  "city" => "Edinburgh",
  "country" => "Scotland"
})

venue8 = Venue.new({
  "name" => "Scotstoun Stadium",
  "city" => "Glasgow",
  "country" => "Scotland"
})

venue9 = Venue.new({
  "name" => "Bridgehaugh Park",
  "city" => "Stirling",
  "country" => "Scotland"
})

venue10 = Venue.new({
  "name" => "NRCA Stadium",
  "city" => "Amsterdam",
  "country" => "The Netherlands"
})

venue1.save()
venue2.save()
venue3.save()
venue4.save()
venue5.save()
venue6.save()
venue7.save()
venue8.save()
venue9.save()
venue10.save()

team1 = Team.new({"name" => "England"})
team2 = Team.new({"name" => "France"})
team3 = Team.new({"name" => "Ireland"})
team4 = Team.new({"name" => "Italy"})
team5 = Team.new({"name" => "Scotland"})
team6 = Team.new({"name" => "Wales"})

team1.save()
team2.save()
team3.save()
team4.save()
team5.save()
team6.save()

competition1 = Competition.new({"name" => "Six Nations"})
competition2 = Competition.new({"name" => "PRO14"})
competition3 = Competition.new({"name" => "PRO12"})
competition4 = Competition.new({"name" => "European Challenge Cup"})
competition5 = Competition.new({"name" => "European Champions Cup"})
competition6 = Competition.new({"name" => "Rugby Europe Trophy"})
competition7 = Competition.new({"name" => "Autumn Internationals"})
competition8 = Competition.new({"name" => "U20 Six Nations"})
competition9 = Competition.new({"name" => "Other"})


competition1.save()
competition2.save()
competition3.save()
competition4.save()
competition5.save()
competition6.save()
competition7.save()
competition8.save()
competition9.save()

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

match1.save()
