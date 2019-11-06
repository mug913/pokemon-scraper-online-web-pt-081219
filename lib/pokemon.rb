class Pokemon

  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(name:,type:,id:,db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end

  def.save
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.type, self.db)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
  end
end
