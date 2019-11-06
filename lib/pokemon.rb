class Pokemon

  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(name:,type:,id:,db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type, db)
      VALUES (?, ?, ?)
    SQL
    db.execute(sql, name, type, db)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]

  end
end
