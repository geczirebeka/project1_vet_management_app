require( 'sinatra' )
require( 'sinatra/contrib/all')

require_relative('../models/animal')
also_reload('../models/*')

get '/animals' do
    @animals = Animal.all
    erb(:'animals/index')
end

get '/animals/:id' do 
    @animal = Animal.find(params[:id])
    erb(:'animals/show')
end