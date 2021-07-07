class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    
    end

    def self.save(poke_name, poke_type, poke_db)
        poke_db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", poke_name, poke_type)
    end

    def self.find (poke_id, db)
        new_pokemon = db.execute(" SELECT * FROM pokemon WHERE id = ? ", poke_id).flatten
        Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db)
    end



end