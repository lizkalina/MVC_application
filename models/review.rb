class Review

  attr_accessor :movie, :review_text, :star_count

  @@all = []

  def initialize(movie, star_count)
    @movie = movie
    @star_count = star_count
    @@all << self
  end

  def self.create_table
  sql =  <<-SQL 
    CREATE TABLE IF NOT EXISTS reviews (
      id INTEGER PRIMARY KEY, 
      movie TEXT,
      star_count INTEGER
      );
      SQL
  DB[:conn].execute(sql) 
  end

  def save
    sql = <<-SQL
      INSERT INTO reviews (movie, star_count) 
      VALUES (?, ?)
    SQL
 
    DB[:conn].execute(sql, self.movie, self.star_count)
  end

  def self.find(id)
    sql = <<-SQL 
    SELECT * FROM reviews WHERE id = ?
    SQL
  end

  def review_text=(review)
    @review = review
    self.save
  end

  def self.all
    sql = <<-SQL
    SELECT * FROM reviews;
    SQL
    DB[:conn].execute(sql)
  end

end
