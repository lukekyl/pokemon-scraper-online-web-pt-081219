

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
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL
      db.execute(sql, name, type)
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]

  end

  def self.find(number, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?",number)
    Pokemon.new(result[0][0], result[0][1], result[0][2], result[0][3])
  end

end
