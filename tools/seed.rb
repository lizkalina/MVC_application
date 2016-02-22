require_relative '../config/environment.rb'
require 'sqlite3'

DB[:conn].execute("DROP TABLE IF EXISTS reviews")
DB[:conn].execute("DROP TABLE IF EXISTS movies")
DB[:conn].execute("DROP TABLE IF EXISTS genres")
DB[:conn].execute("DROP TABLE IF EXISTS users")
DB[:conn].execute("DROP TABLE IF EXISTS movies_genres")

sql = <<-SQL
 CREATE TABLE movies (
    id INTEGER PRIMARY KEY, 
    title TEXT,
    genre_id INTEGER
  );
SQL

DB[:conn].execute(sql)

 
sql = <<-SQL 
  CREATE TABLE reviews (
  id INTEGER PRIMARY KEY, 
  review_text TEXT,
  movie_id INTEGER,
  star_count INTEGER
  );
  SQL

DB[:conn].execute(sql)


sql = <<-SQL 
  CREATE TABLE genres (
  id INTEGER PRIMARY KEY, 
  name TEXT
  );
  SQL

DB[:conn].execute(sql)


sql = <<-SQL 
  CREATE TABLE users (
  id INTEGER PRIMARY KEY, 
  name TEXT,
  user_type TEXT
  );
  SQL

DB[:conn].execute(sql)


sql = <<-SQL
  CREATE TABLE movies_genres (
  id INTEGER PRIMARY KEY, 
  movie_id TEXT,
  genre_id TEXT
  );
SQL

DB[:conn].execute(sql)




ratings = [1, 2, 3, 4, 5]
texts = ['Great movie!', 'This movie sucked.', 'Would recommend highly.', 'Two thumbs down','Fine','Go see it!','Da bomb.','Alright']

genres = ['action', 'romance', 'horror','comedy','sci-fi','historical drama'].collect do |genre|
  genre = Genre.new(name:genre)
  genre.save
  genre
end

movies = ['Zoolander','Braveheart','Clueless','Oceans Eleven','Fight Club'].collect do |name|
  genre_id = genres.shuffle.first.id
  movie = Movie.new(title: name, genre_id:genre_id)
  movie.save
  movie
end

reviews = 25.times.collect do |review|
  movie_id = movies.shuffle.first.id
  star_count = ratings.shuffle.first
  text = texts.shuffle.first
    review = Review.new(movie_id:movie_id).tap do |review|
      review.review_text = text
      review.star_count = star_count
      review.save
    end
end

#genre

#moviesgenres


