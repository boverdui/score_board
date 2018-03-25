require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/competition.rb')

get '/competitions' do
  @competitions = Competition.all()
  erb(:"competitions/index")
end

get '/competitions/new' do
  erb(:"competitions/new")
end

get '/competitions/:id' do
  @competition = Competition.find(params[:id].to_i)
  erb(:"competitions/show")
end

get '/competitions/:id/edit' do
  @competition = Competition.find(params[:id].to_i)
  erb(:"competitions/edit")
end

post '/competitions' do
  if Competition.exists?(params[:name])
    @competition_name = params[:name]
    erb(:"competitions/create_error")
  else
    @competition = Competition.new(params)
    @competition.save()
    redirect to '/competitions'
  end
end

post '/competitions/:id' do
  @competition = Competition.new(params)
  @competition.update()
  redirect to '/competitions'
end

post '/competitions/:id/delete' do
  @competition = Competition.find(params[:id].to_i)
  @competition.delete()
  redirect to '/competitions'
end
