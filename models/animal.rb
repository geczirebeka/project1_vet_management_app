require_relative('../db/sql_runner')
require_relative('./vet.rb')
require_relative('./customer.rb')

class Animal

    attr_reader :id, :vet_id, :customer_id
    attr_accessor :name, :dob, :type, :treatment_notes

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @dob = options['dob']
        @type = options['type']
        @treatment_notes = options['treatment_notes']
        @vet_id = options['vet_id'].to_i
        @customer_id = options['customer_id'].to_i
    end

    def save()
        sql = "INSERT INTO animals (
            name, dob, type, treatment_notes, customer_id, vet_id)
            VALUES
            ($1, $2, $3, $4, $5, $6)
            RETURNING id"
            values = [@name, @dob, @type, @treatment_notes, @customer_id, @vet_id]
            result = SqlRunner.run(sql, values)
            id = result.first['id']
            @id = id.to_i
    end

    def self.delete_all()
        sql = "DELETE FROM animals"
        SqlRunner.run(sql)
    end

    def update()
        sql = "UPDATE animals
        SET
        (name, dob, type, treatment_notes, vet_id, customer_id) =
        ($1, $2, $3, $4, $5, $6)
        WHERE id = $7"
        values = [@name, @dob, @type, @treatment_notes, @vet_id, @customer_id, @id]
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

    def vet()
        sql = "SELECT * FROM vets
        WHERE id = $1"
        values = [@vet_id]
        result = SqlRunner.run(sql, values).first
        return Vet.new(result)
    end

    def customer()
        sql = "SELECT * FROM customers
        WHERE id = $1"
        values = [@customer_id]
        result = SqlRunner.run(sql, values).first
        return Customer.new(result)
    end

end