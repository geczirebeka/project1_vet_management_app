require( 'sinatra' )
require( 'sinatra/contrib/all')

require_relative('../models/animal')
also_reload('../models/*')

get '/animals' do
    @animals = Animal.all
    erb(:'animals/index')
end

get '/animals/new' do
    @customers = Customer.all
    @vets = Vet.all
    erb(:'animals/new')
end

get '/animals/:id' do 
    @animal = Animal.find(params[:id])
    erb(:'animals/show')
end

post '/animals' do
    @animal = Animal.new(params)
    @animal.save
    erb(:'animals/create')
end

get '/animals/:id/edit' do
    @customers = Customer.all
    @vets = Vet.all
    @animal = Animal.find(params[:id])
    erb(:'animals/edit')
end

post '/animals/:id' do 
    animal = Animal.new(params)
    animal.update 
    redirect to '/animals'
end

post '/animals/:id/delete' do
    animal = Animal.find( params[:id] )
    animal.delete()
    redirect to '/animals'
end