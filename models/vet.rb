require_relative('../db/sql_runner')

class Vet

    attr_reader :id, :first_name, :last_name

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
    end

    def save()
        sql = "INSERT INTO vets
        (first_name, last_name)
        VALUES
        ($1, $2)
        RETURNING id"
        values = [@first_name, @last_name]
        result = SqlRunner.run(sql, values)
        id = result.first['id']
        @id = id.to_i
    end

    def self.delete_all()
        sql = "DELETE FROM vets"
        SqlRunner.run(sql)
    end

    def update()
       sql = "UPDATE vets
       SET
       (first_name,
       last_name) = 
       ($1, $2)
       WHERE id = $3"
       values = [@first_name, @last_name, @id]
       SqlRunner.run(sql, values) 
    end

    def delete()
        sql = "DELETE FROM vets
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.all()
        sql = "SELECT * FROM vets"
        vet_data = SqlRunner.run(sql)
        vets = map_items(vet_data)
        return vets
    end

    def self.map_items(vet_data)
        return vet_data.map { |vet| Vet.new(vet)}
    end

    def self.find(id)
        sql = "SELECT * FROM vets
        WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values).first
        vet = Vet.new(result)
        return vet
    end

    def pets()
        sql = "SELECT * FROM animals
        WHERE vet_id = $1"
        values = [@id]
        data = SqlRunner.run(sql, values)
        result = map_items(data)
        return result
    end


end