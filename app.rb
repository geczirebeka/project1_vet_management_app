require('sinatra')
require('sinatra/contrib/all')

require_relative('./controllers/vets_controller')
require_relative('./controllers/customers_controller')
require_relative('./controllers/animals_controller')

get '/' do 
    @vets = Vet.all
    erb(:index)
end
