class Movie

  attr_accessor :name, :genre

  def initialize(name)
    @name = name
  end

  def self.create_table
  sql =  <<-SQL 
    CREATE TABLE IF NOT EXISTS movies (
      id INTEGER PRIMARY KEY, 
      name TEXT,
      # genre_id INTEGER <-- not sure if this should be here or not, it's in the table, but i'm uncertain as to 
      # whether or not this is how we incorporate an ID like this in ruby. 
      );
      SQL
  DB[:conn].execute(sql) 
  end

  def save
    sql = <<-SQL
      INSERT INTO movies (name) 
      VALUES (?)
    SQL
 
    DB[:conn].execute(sql, self.name)
  end

  def self.find(id)
    sql = <<-SQL 
    SELECT * FROM movies WHERE id = ?
    SQL
  end

  def self.all
    sql = <<-SQL
    SELECT * FROM movies;
    SQL
    DB[:conn].execute(sql)
  end

  # def self.names
  #   Movie.all.collect do |review|
  #     review.movie.name
  #   end.uniq.sort
  # end

end