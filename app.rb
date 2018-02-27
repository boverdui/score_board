require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/match_controller')
require_relative('controllers/team_controller')

get '/' do
  erb( :index )
end
