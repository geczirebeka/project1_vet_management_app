require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/vet')
also_reload('../models/*')

get '/vets' do
    @vets = Vet.all
    erb(:'vets/index')
end

# get '/vets/new' do

# end

get '/vets/:id' do 
    @vet = Vet.find(params[:id])
    erb(:'vets/show')
end

get '/vets/:id/edit' do
    @vets = Vet.find(params[:id])
    erb(:'vets/edit')
end

# post '/vets/:id' do 
#     vet = Vet.new(params)
#     vet.update 
#     redirect to "/vets/#{params['id']}"
# end