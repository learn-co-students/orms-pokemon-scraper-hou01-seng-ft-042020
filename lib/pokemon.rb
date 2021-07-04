require 'pry'
class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id: id, name: name, type: type, db: db)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)

        db.execute("INSERT INTO pokemon(name, type) VALUES ('#{name}', '#{type}')")
    end 

    def self.find(id, db)
        pikachu = db.execute("SELECT * FROM pokemon WHERE ID = '#{id}'   ").flatten
        # pikachu.flatten
       please = Pokemon.new(id: pikachu[0], name: pikachu[1], type: pikachu[2], db: db)
       #please 
        #binding.pry

    end
end

