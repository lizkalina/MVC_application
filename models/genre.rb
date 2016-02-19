class Genre

  attr_accessor :genre

  def initialize(genre)
    @genre = genre
  end

  def self.create_table
  sql =  <<-SQL 
    CREATE TABLE IF NOT EXISTS genres (
      id INTEGER PRIMARY KEY, 
      genre TEXT,
      );
      SQL
  DB[:conn].execute(sql) 
  end

  def save
    sql = <<-SQL
      INSERT INTO genres (genre) 
      VALUES (?)
    SQL
 
    DB[:conn].execute(sql, self.genre)
  end

  def self.find(id)
    sql = <<-SQL 
    SELECT * FROM genres WHERE id = ?
    SQL
  end

  def self.all
    sql = <<-SQL
    SELECT * FROM genres;
    SQL
    DB[:conn].execute(sql)
  end

end