class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    string_sql = <<-SQLSTRING
      insert into pokemon
      (name, type) values (?,?)
    SQLSTRING

    db.execute(string_sql, name, type)
  end

  def self.find(id, db)
    string_sql = <<-SQLSTRING
      select * from pokemon where id = ?
    SQLSTRING
    info = db.execute(string_sql, id).flatten
    self.new(id: info[0], name: info[1], type: info[2], db: db, hp: 60)
  end

end
