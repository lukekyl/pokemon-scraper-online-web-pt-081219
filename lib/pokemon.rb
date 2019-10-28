require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
      sql = <<-SQL
        INSERT INTO pokemon (name, type, db)
        VALUES (?, ?, ?)
      SQL
      @db.execute(sql, self.name, self.type, self.db)
      @id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
      
  end

  def find(name)
    sql = "SELECT * FROM pokemon WHERE name = ?"
    result = DB[:conn].execute(sql, name)[0]
    Pokemon.new(result[0], result[1], result[2], result[3])
  end

end
