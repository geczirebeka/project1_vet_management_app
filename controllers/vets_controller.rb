require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('../models/vet')
also_reload('../models/*')

get '/vets' do
    @vets = Vet.all()
    erb(:index)
end