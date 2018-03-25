require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/competition_controller')
require_relative('controllers/match_controller')
require_relative('controllers/team_controller')
require_relative('controllers/venue_controller')

get '/' do
  erb( :index )
end
