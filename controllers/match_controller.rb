require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/competition.rb')
require_relative('../models/match.rb')
require_relative('../models/team.rb')
require_relative('../models/venue.rb')

get '/matches' do
  @matches = Match.all()
  erb(:"matches/index")
end

get '/matches/new' do
  @competitions = Competition.all()
  @teams = Team.all()
  @venues = Venue.all()
  erb(:"matches/new")
end

get '/matches/sort/date/asc' do
  @matches = Match.sort_by_date_asc()
  erb(:"matches/index")
end

get '/matches/sort/date/desc' do
  @matches = Match.sort_by_date_desc()
  erb(:"matches/index")
end

get '/matches/sort/venue/asc' do
  @matches = Match.sort_by_venue_asc()
  erb(:"matches/index")
end

get '/matches/sort/venue/desc' do
  @matches = Match.sort_by_venue_desc()
  erb(:"matches/index")
end

get '/matches/sort/home_team/asc' do
  @matches = Match.sort_by_home_team_asc()
  erb(:"matches/index")
end

get '/matches/sort/home_team/desc' do
  @matches = Match.sort_by_home_team_desc()
  erb(:"matches/index")
end

get '/matches/sort/away_team/asc' do
  @matches = Match.sort_by_away_team_asc()
  erb(:"matches/index")
end

get '/matches/sort/away_team/desc' do
  @matches = Match.sort_by_away_team_desc()
  erb(:"matches/index")
end

get '/matches/sort/competition/asc' do
  @matches = Match.sort_by_competition_asc()
  erb(:"matches/index")
end

get '/matches/sort/competition/desc' do
  @matches = Match.sort_by_competition_desc()
  erb(:"matches/index")
end

get '/matches/search' do
  @matches = Match.search(params[:search_term])
  erb(:"matches/index")
end

get '/matches/:id' do
  @match = Match.find(params[:id].to_i)
  erb(:"matches/show")
end

get '/matches/:id/edit' do
  @match = Match.find(params[:id].to_i)
  @competitions = Competition.all()
  @teams = Team.all()
  @venues = Venue.all()
  erb(:"matches/edit")
end

post '/matches' do
  @match = Match.new(params)
  @match.save()
  redirect to "/matches"
end

post '/matches/:id' do
  @match = Match.new(params)
  @match.update()
  redirect to "/matches/#{params[:id]}"
end

post '/matches/:id/delete' do
  @match = Match.find(params[:id].to_i)
  @match.delete()
  redirect to '/matches'
end
