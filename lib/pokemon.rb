class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id=nil, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

end
