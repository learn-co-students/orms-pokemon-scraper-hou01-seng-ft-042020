require 'sqlite3'

#open a database
db = SQLite3::Database.new "schema_migration.sql" 


class Pokemon
    attr_accessor :id, :name, :type, :db
    @@all = []

    def initialize(id: id,name: name, type: type, db: db)
        @id = id
        @name = name
        @type = type
        @db = db
        @@all << self
    end

    def self.all
        @@all
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db) 
        new_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        Pokemon.new(id: new_array[0], name: new_array[1], type: new_array[2], db: db)
   end

end
