require('pry-byebug')
require_relative('../models/vet')
require_relative('../models/customer')
require_relative('../models/animal')


Animal.delete_all
Vet.delete_all
Customer.delete_all

vet1 = Vet.new({'first_name' => 'Steven', 'last_name' => 'Geczi'})
vet2 = Vet.new({'first_name' => 'Maggie', 'last_name' => 'Pond'})
vet3 = Vet.new({'first_name' => 'Pebble', 'last_name' => 'Morgan'})

vet1.save
vet2.save
vet3.save

customer1 = Customer.new({'name' => 'Harry Gerome', 'address' => '10 Broughton Road', 'tel' => '07649488798'})
customer2 = Customer.new({'name' => 'George Ramsey', 'address' => '300 Easter Road', 'tel' => '07145986245'})
customer3 = Customer.new({'name' => 'Alex Coates', 'address' => '48 Dundas Street', 'tel' => '07984780223'})

customer1.save
customer2.save
customer3.save

animal1 = Animal.new({'name' => 'Mango', 'dob' => '04/04/2020', 'type' => 'dog', 'treatment_notes' => 'first set of injections done', 'customer_id' => customer1.id, 'vet_id' => vet1.id})
animal2 = Animal.new({'name' => 'Cheeky', 'dob' => '15/10/2011', 'type' => 'dog', 'treatment_notes' => 'joint problems', 'customer_id' => customer2.id, 'vet_id' => vet2.id})
animal3 = Animal.new({'name' => 'Sparrow', 'dob' => '06/08/2014', 'type' => 'cat', 'treatment_notes' => 'infected by ticks', 'customer_id' => customer3.id, 'vet_id' => vet3.id})
animal4 = Animal.new({'name' => 'Tiny Feet', 'dob' => '28/07/2003', 'type' => 'tortoise', 'treatment_notes' => 'refuses to eat', 'customer_id' => customer1.id, 'vet_id' => vet1.id})

animal1.save
animal2.save
animal3.save
animal4.save

binding.pry 
nil