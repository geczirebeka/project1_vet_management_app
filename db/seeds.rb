require_relative('../models/vet')
require_relative('../models/animal')

Vet.delete_all
Animal.delete_all

vet1 = Vet.new({'first_name' => 'Steven', 'last_name' => 'Geczi'})
vet2 = Vet.new({'first_name' => 'Maggie', 'last_name' => 'Pond'})
vet3 = Vet.new({'first_name' => 'Pebble', 'last_name' => 'Morgan'})

vet1.save
vet2.save
vet3.save

animal1 = Animal.new({'name' => 'Mango', 'dob' => '04/04/2020', 'type' => 'dog', 'contact_details' => '07649488798', 'treatment_notes' => 'first set of injections done', 'vet_id' => vet1.id})
animal2 = Animal.new({'name' => 'Cheeky', 'dob' => '15/10/2011', 'type' => 'dog', 'contact_details' => '07145986245', 'treatment_notes' => 'joint problems', 'vet_id' => vet3.id})
animal3 = Animal.new({'name' => 'Sparrow', 'dob' => '06/08/2014', 'type' => 'cat', 'contact_details' => '07984780223', 'treatment_notes' => 'infected by ticks', 'vet_id' => vet2.id})
animal4 = Animal.new({'name' => 'Tiny Feet', 'dob' => '28/07/2003', 'type' => 'tortoise', 'contact_details' => '07654899035', 'treatment_notes' => 'refuses to eat', 'vet_id' => vet1.id})

animal1.save
animal2.save
animal3.save
animal4.save

