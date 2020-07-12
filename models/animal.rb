require_relative('../db/sql_runner')
require_relative('./vet.rb')

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

    def save()
        sql = "INSERT INTO animals (
            name, dob, type, contact_details, treatment_notes, vet_id)
            VALUES
            ($1, $2, $3, $4, $5, $6)
            RETURNING id"
            values = [@name, @dob, @type, @contact_details, @treatment_notes, @vet_id]
            @id = SqlRunner.run(sql, values)[0]['id'].to_i
    end



end