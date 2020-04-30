require 'pry'
class Pokemon

    attr_accessor :name, :id, :type, :db
    @@all = []

    def initialize(id:, name:, type:, db:)
        @id, @name, @type, @db = id, name, type, db
    end

    def self.save(n, t, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",n,t)
    end

    def self.find(id, db)
        array = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
        Pokemon.new(id: array[0], name: array[1], type: array[2], db: db)
        # binding.pry
    end


end



# binding.pry
# 0

