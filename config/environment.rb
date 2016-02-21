require 'pry'
require 'sqlite3'

DB = {:conn => SQLite3::Database.new("../db/movies.db")}

DB[:conn].execute("DROP TABLE IF EXISTS reviews")
DB[:conn].execute("DROP TABLE IF EXISTS movies")
DB[:conn].execute("DROP TABLE IF EXISTS genres")
DB[:conn].execute("DROP TABLE IF EXISTS movies_reviews")

sql = <<-SQL
 CREATE TABLE movies (
    id INTEGER PRIMARY KEY, 
    title TEXT,
    genre_id INTEGER
  );
  SQL

DB[:conn].execute(sql)



require_relative '../models/movie.rb'
require_relative '../models/review.rb'
require_relative '../controllers/review_controller.rb'
require_relative '../controllers/movie_controller.rb'
require_relative '../views/reviews/new.rb'
require_relative '../views/reviews/text_review.rb'
require_relative '../views/reviews/star_count.rb'
require_relative '../views/reviews/search_movie.rb'
require_relative '../views/reviews/search_rating.rb'
require_relative '../views/reviews/print_movie.rb'
require_relative '../views/reviews/print_rating.rb'
require_relative '../views/reviews/print_no_reviews.rb'
require_relative '../views/reviews/print_movie_list.rb'
require_relative '../views/movies/prompt_genre.rb'
require_relative '../views/movies/print_movies.rb'