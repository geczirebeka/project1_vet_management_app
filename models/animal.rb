require_relative('../db/sql_runner')

class Animal

    attr_reader :id, :vet_id
    attr_accessor :name, :dob, :type, :contact_details, :treatment_notes

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @dob = options['dob']
        @type = options['type']
        @contact_details = options['contact_details']
        @treatment_notes = options['treatment_notes']
        @vet_id = options['vet_id'].to_i
    end



end