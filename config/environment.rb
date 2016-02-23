require 'pry'
require 'sqlite3'

DB = {:conn => SQLite3::Database.new("../db/movies.db")}


DB[:conn].execute("DROP TABLE IF EXISTS reviews")
DB[:conn].execute("DROP TABLE IF EXISTS movies")
DB[:conn].execute("DROP TABLE IF EXISTS genres")
DB[:conn].execute("DROP TABLE IF EXISTS users")
DB[:conn].execute("DROP TABLE IF EXISTS moviegenres")

sql = <<-SQL
 CREATE TABLE movies (
    id INTEGER PRIMARY KEY, 
    title TEXT
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
  CREATE TABLE moviegenres (
  id INTEGER PRIMARY KEY, 
  movie_id INTEGER,
  genre_id INTEGER
  );
SQL

DB[:conn].execute(sql)



require_relative '../models/movie.rb'
require_relative '../models/review.rb'
require_relative '../models/genre.rb'
require_relative '../models/moviegenre.rb'
require_relative '../controllers/review_controller.rb'
require_relative '../controllers/movie_controller.rb'
require_relative '../views/reviews/new.rb'
require_relative '../views/reviews/prompt_review.rb'
require_relative '../views/reviews/prompt_movie.rb'
require_relative '../views/reviews/prompt_rating.rb'
require_relative '../views/reviews/print_movie.rb'
require_relative '../views/reviews/print_rating.rb'
require_relative '../views/reviews/print_no_reviews.rb'
require_relative '../views/reviews/print_movie_list.rb'
require_relative '../views/movies/prompt_genre.rb'
require_relative '../views/movies/print_movies.rb'
require_relative '../views/movies/print_genre_list.rb'
require_relative '../tools/seed.rb'