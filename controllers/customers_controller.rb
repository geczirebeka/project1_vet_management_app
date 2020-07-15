require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/customer')
also_reload('../models/*')

get '/customers' do
    @customers = Customer.all
    erb(:'customers/index')
end

get '/customers/new' do
    erb(:'customers/new')
end

get '/customers/:id' do 
    @customer = Customer.find(params[:id])
    erb(:'customers/show')
end

post '/customers' do 
    @customer = Customer.new(params)
    @customer.save
    erb(:'customers/create')
end

get '/customers/:id/edit' do
    @customer = Customer.find(params[:id])
    erb(:'customers/edit')
end
  
post '/customers/:id' do 
    customer = Customer.new(params)
    customer.update 
    redirect to '/customers'
end

post '/vets/:id/delete' do
    vet = Vet.find( params[:id] )
    vet.delete()
    redirect to '/vets'
end