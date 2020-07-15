require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/vet')
also_reload('../models/*')

get '/vets' do
    @vets = Vet.all
    erb(:'vets/index')
end

get '/vets/new' do
    erb(:'vets/new')
end

get '/vets/:id' do 
    @vet = Vet.find(params[:id])
    erb(:'vets/show')
end

post '/vets' do 
    @vet = Vet.new(params)
    @vet.save
    erb(:'vets/create')
end

get '/vets/:id/edit' do
    @vet = Vet.find(params[:id])
    erb(:'vets/edit')
end
  
post '/vets/:id' do 
    vet = Vet.new(params)
    vet.update 
    redirect to '/vets'
end

post '/vets/:id/delete' do
    @vet = Vet.new(params)
    for animal in @vet.animals
        animal.unassign()
        animal.update()
    end
    @vet.delete()
    redirect to '/vets'
end