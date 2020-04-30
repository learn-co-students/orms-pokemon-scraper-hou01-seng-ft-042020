require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    # binding.pry
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save (name, type, db)
    # binding.pry
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    # binding.pry
  end

  def self.find(i, db)
  #   Pokemon.save("joe", "fire", db)
  #   Pokemon.save("kevin", "water", db)

    temp = db.execute("SELECT * FROM pokemon").find {|te| te[0] == i}
    Pokemon.new(id: i, name: temp[1], type: temp[2], db: db)
    # x =temp.find {|te| te[0] == i}
    # binding.pry
  end

    # temp = [[1, "Pikachu", "electric"]]
    # temp[0] = [1, "Pikachu", "electric"]
    # temp[0][0] = 1
end


# class Pokemon
#   attr_accessor :id, :name, :type, :db

#   def self.save(name, type, db)
#     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
#   end

#   def self.find(id_num, db)
#     pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
#     Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
#   end

#   def initialize(id:, name:, type:, db:)
#     @id, @name, @type, @db = id, name, type, db
#   end

# end