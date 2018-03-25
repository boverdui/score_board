require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/venue.rb')

get '/venues' do
  @venues = Venue.all()
  erb(:"venues/index")
end

get '/venues/new' do
  erb(:"venues/new")
end

get '/venues/:id' do
  @venue = Venue.find(params[:id].to_i)
  erb(:"venues/show")
end

get '/venues/:id/edit' do
  @venue = Venue.find(params[:id].to_i)
  erb(:"venues/edit")
end

post '/venues' do
  if Venue.exists?(params[:name])
    @venue.name = params[:name]
    erb(:"venues/create_error")
  else
    @venue = Venue.new(params)
    @venue.save()
    redirect to '/venues'
  end
end

post '/venues/:id' do
  @venue = Venue.new(params)
  @venue.update()
  redirect to '/venues'
end

post '/venues/:id/delete' do
  @venue = Venue.find(params[:id].to_i)
  @venue.delete()
  redirect to '/venues'
end
