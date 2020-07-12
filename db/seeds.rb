require_relative('../models/vet')

Vet.delete_all()

vet1 = Vet.new({'first_name' => 'Steven', 'last_name' => 'Geczi'})
vet2 = Vet.new({'first_name' => 'Maggie', 'last_name' => 'Pond'})
vet3 = Vet.new({'first_name' => 'Pebble', 'last_name' => 'Morgan'})

vet1.save
vet2.save
vet3.save