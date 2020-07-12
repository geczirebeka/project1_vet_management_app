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

    def self.delete_all()
        sql = "DELETE FROM animals"
        SqlRunner.run(sql)
    end

    def update()
        sql = "UPDATE animals
        SET
        (name, dob, type, contact_details, treatment_notes, vet_id) =
        ($1, $2, $3, $4, $5, $6)
        WHERE id = $7"
        values = [@name, @dob, @type, @contact_details, @treatment_notes, @vet_id, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM animals
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.all()
        sql = "SELECT * FROM animals"
        animals = SqlRunner.run(sql)
        result = animals.map { |animal| Animal.new(animal)}
        return result
    end

    def self.find(id)
        sql = "SELECT * FROM animals
        WHERE id = $1"
        values = [id]
        animal = SqlRunner.run(sql, values).first
        result = Animal.new(animal)
        return result
    end

    # def vet()
    #     sql = "SELECT * FROM vets
    #     WHERE "
    # end




end