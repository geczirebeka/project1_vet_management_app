require_relative('../db/sql_runner')

class Customer

    attr_reader :id
    attr_accessor :name, :address, :tel

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @address = options['address']
        @tel = options['tel']
    end

    def save()
        sql = "INSERT INTO customers
        (name, address, tel)
        VALUES
        ($1, $2, $3)
        RETURNING id"
        values = [@name, @address, @tel]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i
    end

    def update()
        sql = "UPDATE customers
        SET (name, address, tel)
        = ($1, $2, $3)
        WHERE id = $4"
        values = [@name, @address, @tel, @id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM customers"
        SqlRunner.run(sql)
    end

    def delete()
        sql = "DELETE FROM customers
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.all()
        sql = "SELECT * FROM customers"
        customers = SqlRunner.run(sql)
        result = customers.map { |customer| Customer.new(customer)}
        return result
    end

    def self.find(id)
        sql = "SELECT * FROM customers
        WHERE id = $1"
        values = [id]
        customers = SqlRunner.run(sql, values).first
        result = Customer.new(customers)
        return result
    end

    def animals()
        sql = "SELECT * FROM animals
        WHERE customer_id = $1"
        values = [@id]
        animal_data = SqlRunner.run(sql, values)
        result = animal_data.map { |customer| Customer.new(customer)}
        return result
    end

end