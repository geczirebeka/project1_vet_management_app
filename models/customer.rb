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

end