class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def save(name:, type:, db:)
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO pokemon (name, type, db)
        VALUES (?, ?, ?)
      SQL
      DB[:conn].execute(sql, self.id, self.type, self.db)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end
  end

  def find(name)
    sql = "SELECT * FROM pokemon WHERE name = ?"
    result = DB[:conn].execute(sql, name)[0]
    Pokemon.new(result[0], result[1], result[2], result[3])
  end

end
