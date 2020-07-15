require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/animal.rb')
require_relative('../models/customer.rb')
require_relative('../models/vet.rb')

class AnimalTest < Minitest::Test

    def setup
        @animal = Animal.new("Mango", "04/04/2020", "dog", "07649488798", "first set of injections done", "customer1.id")
    end

    def test_assign_to_vet(vet_id)
        assert_equal()
    end

    def test_unassign()
        assert_equal
    end

end