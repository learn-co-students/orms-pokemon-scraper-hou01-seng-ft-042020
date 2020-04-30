class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(name)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        # name = @name
        # type = @type
        #db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name,type)
    end

    def self.find(id,db)
        new_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        Pokemon.new(id: new_array[0],name: new_array[1],type: new_array[2],db: db)
    end
end
