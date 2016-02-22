require_relative '../config/environment.rb'
require 'sqlite3'


ratings = [1, 2, 3, 4, 5]
texts = ['Great movie!', 'This movie sucked.', 'Would recommend highly.', 'Two thumbs down','Fine','Go see it!','Da bomb.','Alright']

genres = ['action', 'romance', 'horror','comedy','sci-fi','historical drama'].collect do |genre|
  genre = Genre.new(name:genre)
  genre.save
  genre
end

movies = ['Zoolander','Braveheart','Clueless','Oceans Eleven','Fight Club'].collect do |name|
  movie = Movie.new(title: name)
  movie.save
  movie
end

reviews = 100.times.collect do |review|
  movie_id = movies.shuffle.first.id
  star_count = ratings.shuffle.first
  text = texts.shuffle.first
    review = Review.new(movie_id:movie_id).tap do |review|
      review.review_text = text
      review.star_count = star_count
      review.save
    end
end


#moviesgenres

sql = <<-SQL 
  SELECT genres.id FROM genres;
  SQL

genre_ids_hash = DB[:conn].execute(sql)
genre_ids = genre_ids_hash.collect { |hash| hash["id"] } 

sql = <<-SQL 
  SELECT movies.id FROM movies;
  SQL

movie_ids_hash = DB[:conn].execute(sql)
movie_ids = movie_ids_hash.collect { |hash| hash["id"] } 


moviesgenres = 50.times.each do |row| 
  movie_id = movies.shuffle.first.id
  genre_id = genres.shuffle.first.id
  moviegenre = Moviegenre.new(movie_id:movie_id, genre_id:genre_id)
  moviegenre.save
end