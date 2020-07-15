require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/vet.rb')

class VetTest < Minitest::Test

    def setup
        @vet = Vet.new({'first_name' => 'Steven', 'last_name' => 'Geczi'})
    end

    def test_full_name()
        assert_equal("Steven Geczi", @vet.full_name())
    end

end