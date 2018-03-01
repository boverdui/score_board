require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/team.rb')

get '/teams' do
  @teams = Team.all()
  erb(:"teams/index")
end

get '/teams/new' do
  erb(:"teams/new")
end

get '/teams/:id' do
  @team = Team.find(params[:id].to_i)
  erb(:"teams/show")
end

get '/teams/:id/edit' do
  @team = Team.find(params[:id].to_i)
  erb(:"teams/edit")
end

post '/teams' do
  if Team.exists?(params[:name])
    @team_name = params[:name]
    erb(:"teams/create_error")
  else
    @team = Team.new(params)
    @team.save()
    redirect to '/teams'
  end
end

post '/teams/:id' do
  @team = Team.new(params)
  @team.update()
  redirect to '/teams'
end

post '/teams/:id/delete' do
  @team = Team.find(params[:id].to_i)
  @team.delete()
  redirect to '/teams'
end
