require('sinatra')
require('sinatra/contrib/all')

require_relative('./controllers/vets_controller')

get '/' do 
    @vets = Vet.all
    erb(:index)
end
